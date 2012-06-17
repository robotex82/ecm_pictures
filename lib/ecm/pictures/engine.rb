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
    end
  end  
end
