class Item < ApplicationRecord
   mount_uploader :image, ImageUploader
   has_many_attached :images

   belongs_to :user, optional: true
   belongs_to :order, optional: true
   has_many :comments, as: :commentable, dependent: :destroy

   # def image_url
   #   image.url.present? ? image.url(:square) : '/img/14.jpg'
   # end

end
