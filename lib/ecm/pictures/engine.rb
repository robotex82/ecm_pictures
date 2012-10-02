module Ecm
  module Pictures
    class Engine < Rails::Engine
      initializer :ecm_pictures_engine do
        ActiveAdmin.setup do |active_admin_config|
          active_admin_config.load_paths += Dir[File.dirname(__FILE__) + '/active_admin']
        end if defined?(ActiveAdmin)
      end
    end
  end
end

