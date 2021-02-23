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
      it 'imageがないと保存できない事' do
        @memory.image = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Imageを入力してください")
      end
      it 'memoryが記入されていないと保存できない事' do
        @memory.memory = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Memoryを入力してください")
      end
    end
  end
end
