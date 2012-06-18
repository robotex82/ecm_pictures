class Ecm::Pictures::PictureGallery < ActiveRecord::Base
  self.table_name = 'ecm_pictures_picture_galleries'
  
  # associations
  has_many :pictures
  
  # acts as list
  acts_as_list
  
  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  # attributes
  attr_accessible :description, :name  
end
