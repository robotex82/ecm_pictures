module Ecm
  module Pictures
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Copies the locale files to your application"

        source_root File.expand_path('../../../../../../config/locales', __FILE__)

        def generate_locales
#          copy_file "ecm.pictures.en.yml", "config/locales/ecm.pictures.en.yml"
          copy_file "ecm.pictures.de.yml", "config/locales/ecm.pictures.de.yml"

#          copy_file "ecm.pictures.picture.en.yml", "config/locales/ecm.pictures.picture.en.yml"
          copy_file "ecm.pictures.picture.de.yml", "config/locales/ecm.pictures.picture.de.yml"

#          copy_file "ecm.pictures.picture_gallery.en.yml", "config/locales/ecm.pictures.picture_gallery.en.yml"
          copy_file "ecm.pictures.picture_gallery.de.yml", "config/locales/ecm.pictures.picture_gallery.de.yml"
        end
      end
    end
  end
end

