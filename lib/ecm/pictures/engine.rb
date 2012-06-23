require 'rubygems'

require 'acts_as_list'
require 'active_admin-acts_as_list'
require 'friendly_id'
require 'paperclip'

# Ecm::Admin should do this!
require 'activeadmin' 
require 'sass-rails'
require 'meta_search'

module Ecm
  module Pictures
    class Engine < Rails::Engine
      paths["config/locales"] << File.dirname(__FILE__) + '/../../../config/locales'
      
      # Enabling assets precompiling under rails 3.1 or greater
      if Rails.version >= '3.1'
        initializer "ecm_pictures.asset_pipeline" do |app|
          app.config.assets.precompile << 'ecm_pictures.js'
          app.config.assets.precompile << 'ecm_pictures.css'
        end
      end
      
      config.to_prepare do
        ApplicationController.helper(Ecm::PicturesHelper)
      end  
      
      initializer :ecm_pictures_engine do
        ActiveAdmin.setup do |active_admin_config|
          active_admin_config.load_paths += Dir[File.dirname(__FILE__) + '/../../../app/admin']
        end
      end 
    end
  end  
end
