$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/pictures/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_pictures"
  s.version     = Ecm::Pictures::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "http://blog.robotex.de"
  s.summary     = "Picture galleries for active admin."
  s.description = "Provides picture galleries for active admin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.5"
  s.add_dependency "paperclip", "~> 3.0"
  s.add_dependency "friendly_id", "~> 4.0.1"
  s.add_dependency "acts_as_list", "~> 0.1.6"
  s.add_dependency "active_admin-acts_as_list", "~> 0.0.5"

  s.add_development_dependency "sqlite3"
  
  # Testing
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "factory_girl_rails"  
  
  # Server
  s.add_development_dependency "thin"  
  
  # Dummy App
  s.add_development_dependency "activeadmin"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "meta_search", ">= 1.1.0.pre"
end
