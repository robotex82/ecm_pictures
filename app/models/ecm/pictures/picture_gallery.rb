class Ecm::Pictures::PictureGallery < ActiveRecord::Base
  self.table_name = 'ecm_pictures_pictures'
  
  has_many :pictures
  
  #friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged
end
