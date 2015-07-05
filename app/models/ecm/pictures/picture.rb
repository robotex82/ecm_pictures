class Ecm::Pictures::Picture < ActiveRecord::Base
  self.table_name = 'ecm_pictures_pictures'

  # associations
  belongs_to :picture_gallery, :counter_cache => true
  has_many :attached_pictures, :foreign_key => 'ecm_pictures_picture_id'
  # attributes
  attr_accessible :description,
                  :image,
                  :markup_language,
                  :name,
                  :picture_gallery_id,
                  :position

  # acts as list
  acts_as_list :scope => :picture_gallery

  # acts as markup
  acts_as_markup :language => :variable, :columns => [ :description, :description ]

  # callbacks
  after_initialize :set_defaults
  before_validation :set_name_from_image_file_name, :if => Proc.new { |p| ( p.name.nil? || p.name.empty? ) }

  # default scope
  default_scope :order => "picture_gallery_id, position ASC"

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged

  # paperclip
  has_attached_file :image,
                    :styles => Ecm::Pictures::Configuration.picture_image_styles

  # validations
  # validates :image, :attachment_presence => true
  validates_attachment_presence :image
  validates :markup_language, :presence  => true,
                              :inclusion => Ecm::Pictures::Configuration.markup_languages
  validates :name, :presence => true

  def display_code(style)
    case style
    when :erb
      "<%= render_picture '#{self.name}' %>"
    when :textile
      "!#{image.url}!".gsub(/\?[0-9]*/, '')
    else
    end
  end

  def to_s
    name
  end

  private

  def set_defaults
    if self.new_record?
      self.markup_language ||= Ecm::Pictures::Configuration.default_markup_language
    end
  end

  def set_name_from_image_file_name
    self.name = File.basename(image_file_name, File.extname(image_file_name)) unless image_file_name.nil?
  end
end

