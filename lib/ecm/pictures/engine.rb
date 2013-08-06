module Ecm
  module Pictures
    class Engine < Rails::Engine
      initializer :ecm_pictures_engine do
        ::ActiveAdmin.setup do |config|
          config.load_paths << File.join(self.root, 'app/admin')
        end
      end
    end
  end
end

