Ecm::Pictures.configure do |config|
  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ markdown rdoc textile ]
  config.markup_languages = %w[ markdown rdoc textile ]

  # Default markup language
  #
  # default: config.default_markup_language = 'textile'
  config.default_markup_language = 'textile'

  # CSS Classes for the li tag holding the picture previews inside a gallery.
  #
  # default: config.picture_for_gallery_css_classes = 'span4'
  config.picture_for_gallery_css_classes = 'picture span4'

  # Image sizes for slider items
  #
  # default:   config.picture_image_styles = {
  #              :small_thumb   => "80x60",
  #              :medium_thumb  => "160x120",
  #              :default_thumb => "260x180"
  #            }
  config.picture_image_styles = {
    :small_thumb   => "80x60",
    :medium_thumb  => "160x120",
    :default_thumb => "260x180"
  }
end

