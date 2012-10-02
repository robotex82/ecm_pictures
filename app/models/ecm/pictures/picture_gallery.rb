class Ecm::Pictures::PictureGallery < ActiveRecord::Base
  self.table_name = 'ecm_pictures_picture_galleries'

  # associations
  has_many :pictures,
           :dependent => :destroy,
           :order => 'position'

  # attributes
  attr_accessible :description,
                  :link_images,
                  :markup_language,
                  :name,
                  :pictures_attributes,
                  :position
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  # acts as list
  acts_as_list
  default_scope :order => 'position ASC'

  # acts as markup
  acts_as_markup :language => :variable, :columns => [ :description ]

  # callbacks
  after_initialize :set_defaults

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # validations
  validates :markup_language, :presence  => true,
                              :inclusion => Ecm::Pictures::Configuration.markup_languages
  validates :name, :presence => true,
                   :uniqueness => true

  def display_code
    "<%= render_picture_gallery '#{self.name}' %>"
  end

  def to_s
    name
  end

  private

  def set_defaults
    if self.new_record?
      self.link_images = true if self.link_images.nil?
      self.markup_language ||= Ecm::Pictures::Configuration.default_markup_language
    end
  end
end

