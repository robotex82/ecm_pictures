require 'rubygems'
require 'paperclip'
require 'friendly_id'

# Ecm::Admin should do this!
require 'activeadmin' 
require 'sass-rails'
require 'meta_search'

module Ecm
  module Pictures
    class Engine < Rails::Engine
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
