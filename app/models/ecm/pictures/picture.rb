class Ecm::Pictures::Picture < ActiveRecord::Base
  self.table_name = 'ecm_pictures_pictures'

  # associations
  belongs_to :picture_gallery, :counter_cache => true

  # attributes
  attr_accessible :description,
                  :image,
                  :name,
                  :picture_gallery_id,
                  :position

  # acts as list
  acts_as_list :scope => :picture_gallery
  
  # callbacks
  before_validation :set_name_from_image_file_name, :if => Proc.new { |p| p.name.nil? }

  # default scope
  default_scope :order => "picture_gallery_id, position ASC"

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # paperclip
  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # validations
  # validates :image, :attachment_presence => true
  validates_attachment_presence :image
  validates :name, :presence => true
  
  private
  
  def set_name_from_image_file_name
    self.name = File.basename(image_file_name, File.extname(image_file_name)) unless image_file_name.nil?
  end
end

