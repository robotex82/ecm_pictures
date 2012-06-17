require 'rubygems'
require 'paperclip'
require 'friendly_id'

module Ecm
  module Pictures
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::PicturesHelper)
      end  
    end
  end  
end
