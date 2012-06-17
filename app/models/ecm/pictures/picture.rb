class Ecm::Pictures::Picture < ActiveRecord::Base
  self.table_name = 'ecm_pictures_pictures'
  
  belongs_to :picture_gallery, :counter_cache => true
  
  #friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged
end
