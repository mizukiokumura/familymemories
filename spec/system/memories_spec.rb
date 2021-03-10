require 'rails_helper'

RSpec.describe "Memories", type: :system do
  before do
    @memory = FactoryBot.build(:memory)
  end

  context 'memoryが登録できる時' do
    it "正しい情報を入力すればmemoryが登録できてトップページに表示される。" do
    # あらかじめユーザーをDBに保存する。
    @user = FactoryBot.create(:user)
    # トップページに移動する
    visit root_path
    # トップページのプルダウンボタンを押す
    expect( 
      find('button[type="button"]').click
    ).to have_content("")
    # ログインボタンがあることを確認する
    expect(page).to have_content("ログイン")
    # ログインボタンを押してログインページに遷移する
    click_on('ログイン')
    # ログインをする
    sign_in(@user)
    # 再度トップページのプルダウンボタンを押す
    expect( 
      find('button[type="button"]').click
    ).to have_content("")
    # トップページのプルダウンの中にNewMemoryCreateのボタンがあることを確認する
    expect(page).to have_content("NewMemoryCreate")
    # NewMemoryCreateボタンを押すとMemoryCreateページに遷移する。
    expect(
      find('a[class="btn btn-primary active"]').click
    ).to  have_content("MemoryCreate")
    # 正しい情報を入力する
    fill_in 'タイトル',            with: @memory.title
    fill_in 'Diary',              with: @memory.diary 
    image_path = Rails.root.join('public/images/test_image.png')
    attach_file('memory[images][]', image_path, make_visible: true)
    select '2021',                from: 'memory_memory_1i'
    select '1',                   from: 'memory_memory_2i'
    select '21',                  from: 'memory_memory_3i'
    # 作成するボタンを押すとDBに値が保存されている事を確認する。
    expect {
      find('input[name="commit"]').click
    }.to change{ Memory.count }.by(1)
    # トップページに遷移している。
    visit root_path
    end
  end
  context 'memoryが登録できない時' do
    it '正しく情報を入力しないとmemoryが登録できずにmemoryページに戻ってくる' do
      # あらかじめDBにユーザーを保存しておく。
      @user = FactoryBot.create(:user)
      # トップページに移動する
      visit root_path
      # トップページのプルダウンボタンを押す
      expect( 
        find('button[type="button"]').click
      ).to have_content("")
      # ログインボタンを押してログイン画面に遷移する
      click_on('ログイン')
      # ログインをする
      sign_in(@user)
      # トップページに戻ってきていることを確認する。
      expect(current_path).to eq(root_path)
      # トップページのプルダウンボタンを押す
      expect( 
        find('button[type="button"]').click
      ).to have_content("")
      # トップページのプルダウンボタンのNewMemoryCreateのボタンを押す。
      expect(
        find('a[class="btn btn-primary active"]').click
      ).to have_content("MemoryCreate")
      sleep(2)
      # memory情報を入力する。
    fill_in 'タイトル',            with: ''
    fill_in 'Diary',              with: ''
      # 作成するボタンを押してもmemoryモデルのカウントは上がらないことを確認する。
      expect {
        find('input[name="commit"]').click
      }.to change{ Memory.count }.by(0)
      # 新規登録ページへ戻される事を確認する。
      expect(current_path).to eq('/memories')
    end
  end
end
