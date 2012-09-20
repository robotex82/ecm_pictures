require 'rubygems'

require 'acts_as_list'
require 'active_admin-acts_as_list'
require 'friendly_id'
require 'paperclip'

# Ecm::Admin should do this!
require 'activeadmin'
require 'sass-rails'
require 'meta_search'

require 'ecm/pictures/engine'
require 'ecm/pictures/configuration'
require 'ecm/pictures/version'

module Ecm
  module Pictures
    extend Configuration
  end
end

