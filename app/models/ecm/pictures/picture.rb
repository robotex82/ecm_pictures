class Ecm::Pictures::Picture < ActiveRecord::Base
  self.table_name = 'ecm_pictures_pictures'
  
  belongs_to :picture_gallery
end
