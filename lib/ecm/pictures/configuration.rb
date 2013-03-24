require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module Pictures
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :markup_languages
      @@markup_languages = []

      mattr_accessor :default_markup_language
      @@default_markup_language = nil

      mattr_accessor :picture_for_gallery_css_classes
      @@picture_for_gallery_css_classes = nil

      mattr_accessor :picture_image_styles
      @@picture_image_styles = {}
      def picture_image_styles=(picture_image_styles)
        @@picture_image_styles = HashWithIndifferentAccess.new(picture_image_styles)
      end
    end
  end
end
