class Item < ApplicationRecord
   mount_uploader :image, ImageUploader

   def image_url
     item.image.url || '/img/14.jpg'
   end
   
end
