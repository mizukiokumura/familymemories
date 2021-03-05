require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録できる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する。' do
      # トップページに移動する
      visit root_path 
      # 右上のプルダウンボタンを押すと、プルダウンメニューが表示される。
      expect( 
        find('button[type="button"]').click
      ).to have_content("")
      # プルダウンメニューの中に新規登録ボタンとログインボタンがあること
      expect(page).to have_content("新規登録"), have_content("ログイン")
      # 新規登録ボタンを押すと新規登録ページに移動する。
      expect(
        find('a[class="text-white btn btn-success mb-1"]').click
      ).to have_content("新規登録")
      # 新規登録ページに移動する。
      visit new_user_registration_path
      # ユーザー情報を入力する。
      fill_in 'ニックネーム',                               with: @user.nickname
      fill_in '姓',                                       with: @user.jp_first_name
      fill_in '名',                                       with: @user.jp_last_name
      fill_in 'セイ',                                     with: @user.jp_kana_first_name
      fill_in 'メイ',                                     with: @user.jp_kana_last_name
      fill_in 'メールアドレス',                             with: @user.email
      fill_in 'パスワードを入力してください',                 with: @user.password
      fill_in '確認の為に再度同じパスワードを入力して下さい',   with: @user.password_confirmation
      fill_in 'プロフィール',                              with: @user.profile
      select '1994',                                     from: 'user_birthday_1i'
      select '8',                                        from: 'user_birthday_2i'
      select '10',                                       from: 'user_birthday_3i'
      # 新規登録ボタンを押すとユーザーモデルのカウントが１上がることを確認する。
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(1)
      # トップページへ遷移したことを確認する。
      expect(current_path).to eq(root_path)
      # 右上のプルダウンボタンを押すと、ログアウトボタンやユーザー編集ボタンが表示されることを確認する。
      expect(
        find('button[type="button"]').click
      ).to have_content('')
      # 右上のプルダウンボタンの中にユーザー編集ボタンと、ログアウトボタンがある事を確認する。
      expect(page).to have_content('ユーザー編集'), have_content('ログアウト') 
      # 新規登録ボタンやログインページへ遷移するボタンが表示されていない事を確認する。
      expect(page).to have_no_content("ログイン")
    end
  end
  context 'ユーザー新規登録できない時' do
    it '誤った情報を入力するとユーザー登録できないこと' do
      # トップページに移動する
      visit root_path
      # トップページの右上にあるプルダウンボタンを押す
      expect( 
        find('button[type="button"]').click
      ).to have_content("")
      # プルダウンボタンの中に、新規登録ボタンがある事を確認する
      expect(page).to have_content("新規登録")
      # 新規登録ボタンを押すと新規登録ページに遷移する
      expect(
        find('a[class="text-white btn btn-success mb-1"]').click
      ).to have_content("新規登録")
      # 新規登録ページに遷移している。
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム',                               with: ''
      fill_in '姓',                                       with: ''
      fill_in '名',                                       with: ''
      fill_in 'セイ',                                     with: ''
      fill_in 'メイ',                                     with: ''
      fill_in 'メールアドレス',                             with: ''
      fill_in 'パスワードを入力してください',                 with: ''
      fill_in '確認の為に再度同じパスワードを入力して下さい',   with: ''
      fill_in 'プロフィール',                              with: ''
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(0)
      # 新規登録ページへ戻されることを確認する 
      expect(current_path).to eq('/users') 
    end
  end
end
