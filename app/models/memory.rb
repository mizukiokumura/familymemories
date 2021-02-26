class Memory < ApplicationRecord
  belongs_to :user
  has_many :comments,   dependent: :destroy
  has_many_attached :images
  validate :images_length, :images_size
  with_options presence: true do
    validates :title 
    validates :memory
    validates :images
    validates :diary
    validates :user
  end

  private

  def images_size
    images.each do |image| 
      if image.blob.byte_size > 30.megabytes
       errors.add(:images, "はファイルサイズ30MB以内にして下さい")
      end
    end
  end

  def images_length
    if images.length > 4
      errors.add(:images,"は４枚以内にして下さい")
    end
  end

  def self.search(search)
    if search != ""
      Memory.where('title LIKE(?)', "%#{search}%")
    end
  end
end
