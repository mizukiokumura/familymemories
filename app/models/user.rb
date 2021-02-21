class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: {with: /\A[ぁ-んァ-ン一-龥々]/, message: '全角で入力してください'} do
     validates :jp_first_name
     validates :jp_last_name
    end
    with_options format: {with: /\A[ァ-ヶー-]+\z/, message: '全角カタカナで入力してください'} do
      validates :jp_kana_first_name
      validates :jp_kana_last_name
    end
  end
end
