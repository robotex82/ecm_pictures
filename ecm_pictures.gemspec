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
  s.summary     = "TODO: Summary of EcmPictureGallery."
  s.description = "TODO: Description of EcmPictureGallery."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.5"
  s.add_dependency "paperclip", "~> 3.0"
  s.add_dependency "friendly_id", "~> 4.0.1"

  s.add_development_dependency "sqlite3"
  
  # Testing
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "factory_girl_rails"  
end
