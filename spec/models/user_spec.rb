require 'rails_helper'

RSpec.describe User, type: :model do
  describe "create" do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー新規登録できる時' do
      it 'ユーザーの情報が正しく入力されていれば登録できること。' do
        expect(@user).to be_valid
      end
      it 'ユーザーのprofileが記入されていなくても登録できる事。' do
        @user.profile = ''
        expect(@user).to be_valid 
      end
    end
    context 'ユーザー新規登録できない時' do
      it 'ユーザーのnicknameが入力されていないと登録できないこと。' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'ユーザーのemailが入力されていないと登録できない事。' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'ユーザーのemailが重複していると登録できないこと。' do
        @user.save
        current_user = FactoryBot.build(:user)
        current_user.email = @user.email
        current_user.valid?
        expect(current_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない事。' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下では登録できないこと' do
        @user.password = 'waga'
        @user.password_confirmation = 'waga'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'password_confirmationがpasswordと違うと登録できない事' do
        @user.password = "aaaaaa"
        @user.password_confirmation = 'abababa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'jp_first_nameが全角日本語じゃ無いと登録できない事' do
        @user.jp_first_name = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp first name 全角で入力してください")
      end
      it 'jp_first_nameが空だと登録できない事' do
        @user.jp_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp first name can't be blank")
      end
      it 'jp_last_nameが空だと登録できない事' do
        @user.jp_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp last name can't be blank")
      end
      it 'jp_last_nameが全角じゃ無いと登録できないこと' do
        @user.jp_last_name = 'hogehuga'
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp last name 全角で入力してください")
      end
      it 'jp_kana_first_nameが空だと登録できない事' do
        @user.jp_kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp kana first name can't be blank")
      end
      it 'jp_kana_first_nameが全角カナじゃ無いと登録できない事' do
        @user.jp_kana_first_name = 'hogehuge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp kana first name 全角カタカナで入力してください")
      end
      it 'jp_kana_last_nameが空だと登録できない事' do
        @user.jp_kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp kana last name can't be blank")
      end
      it 'jp_kana_last_nameが全角カナじゃないと登録できない事' do
        @user.jp_kana_last_name = 'hogehoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Jp kana last name 全角カタカナで入力してください")
      end
      it 'birthdayが空だと保存できない事' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
  
end
