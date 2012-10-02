require 'acts_as_list'
require 'acts_as_markup'
require 'active_admin-acts_as_list'
require 'friendly_id'
require 'paperclip'

require 'ecm/pictures/engine'
require 'ecm/pictures/configuration'
require 'ecm/pictures/version'

module Ecm
  module Pictures
    extend Configuration
  end
end

