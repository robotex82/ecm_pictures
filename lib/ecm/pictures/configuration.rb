require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Ecm
  module Pictures
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :markup_languages do
        []
      end

      mattr_accessor :default_markup_language do
        nil
      end

      mattr_accessor :picture_css_classes do
        'picture span3'
      end

      mattr_accessor :picture_for_gallery_css_classes do
        'picture span4'
      end

      mattr_accessor :picture_gallery_preview_div_css_classes do
        'thumbnail'
      end

      mattr_accessor :picture_gallery_preview_li_css_classes do
        'span4'
      end

      mattr_accessor :picture_image_styles do
        {}
      end

      def picture_image_styles=(picture_image_styles)
        @@picture_image_styles = HashWithIndifferentAccess.new(picture_image_styles)
      end
    end
  end
end
