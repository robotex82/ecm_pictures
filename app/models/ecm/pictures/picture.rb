class Ecm::Pictures::Picture < ActiveRecord::Base
  self.table_name = 'ecm_pictures_pictures'
  
  # associations
  belongs_to :picture_gallery, :counter_cache => true
  
  # acts as list
  acts_as_list :scope => :picture_gallery
  
  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  # paperclip
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  # attributes
  attr_accessible :description, :image, :name
end
