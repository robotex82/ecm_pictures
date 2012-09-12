class Ecm::Pictures::PictureGallery < ActiveRecord::Base
  self.table_name = 'ecm_pictures_picture_galleries'

  # associations
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  # attributes
  attr_accessible :description,
                  :link_images,
                  :name,
                  :pictures_attributes

  # acts as list
  acts_as_list
  default_scope :order => 'position ASC'

  # callbacks
  after_initialize :set_defaults

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # validations
  validates :name, :presence => true,
                   :uniqueness => true

  def display_code
    "<%= render_picture_gallery '#{self.name}' %>"
  end

  private

  def set_defaults
    if new_record?
      self.link_images = true if self.link_images.nil?
    end
  end
end

