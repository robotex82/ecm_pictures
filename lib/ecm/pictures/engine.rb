module Ecm
  module Pictures
    class Engine < Rails::Engine
      initializer :ecm_pictures_engine do
        ::ActiveAdmin.setup do |config|
          config.load_paths << File.join(self.root, 'app/admin')
          config.register_javascript 'ecm_pictures.js'
          config.register_stylesheet 'ecm_pictures.css'
        end # ::ActiveAdmin.setup do |config|
      end # initializer :ecm_pictures_engine do
    end # class Engine < Rails::Engine
  end # module Pictures
end # module Ecm

