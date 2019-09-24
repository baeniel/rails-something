class Item < ApplicationRecord
   mount_uploader :image, ImageUploader

   belongs_to :user, optional: true

   def image_url
     image.url.present? ? image.url(:square) : '/img/14.jpg'
   end

end
