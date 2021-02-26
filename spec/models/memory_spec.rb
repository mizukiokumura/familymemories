require 'rails_helper'

RSpec.describe Memory, type: :model do
  describe '作成' do
    before do
      @memory = FactoryBot.build(:memory)
    end

    context '正しく情報が記入されていれば保存できる時' do
      it '情報が記入されていると保存できる事' do
        expect(@memory).to be_valid
      end
    end

    context '正しく情報が記入されていないと保存できない事' do
      it 'titleが記入されていないと保存できない事' do
        @memory.title = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Titleを入力してください")
      end
      it 'diaryが記入されていないと保存できない事' do
        @memory.diary = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Diaryを入力してください")
      end
      it 'imagesがないと保存できない事' do
        @memory.images = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Imagesを入力してください")
      end
      it 'imagesが5枚以上あると保存できない事' do
        @memory.images = nil
        5.times do
          @memory.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        end
        @memory.valid?
        expect(@memory.errors.full_messages).to include('Imagesは４枚以内にして下さい')
      end
      it 'imagesの容量が30MB以上だと保存できない' do
        @memory.images = nil
        @memory.images.attach(io: File.open('public/videos/top_page.mp4'), filename: 'top_page.mp4')
        @memory.valid?
        expect(@memory.errors.full_messages).to include('Imagesはファイルサイズ30MB以内にして下さい')
      end
      it 'memoryが記入されていないと保存できない事' do
        @memory.memory = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Memoryを入力してください")
      end
    end
  end
end
