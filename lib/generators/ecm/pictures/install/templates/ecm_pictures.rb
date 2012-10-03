Ecm::Pictures.configure do |config|
  # markup options

  # Accepted markup languages
  config.markup_languages = %w[ markdown rdoc textile ]

  # Default markup language
  config.default_markup_language = 'textile'

  # picture options

  # image sizes for slider items
  config.picture_image_styles = {
    :small_thumb   => "80x60",
    :medium_thumb  => "160x120",
    :default_thumb => "260x180"
  }
end
