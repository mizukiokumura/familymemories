class Memory < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :title 
    validates :memory
    validates :image
    validates :diary
    validates :user
  end
end
