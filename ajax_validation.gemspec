$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ajax_validation/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ajax_validation"
  s.version     = AjaxValidation::VERSION
  s.authors     = ["Alexey Gordienko"]
  s.email       = ["alx@anadyr.org"]
  s.homepage    = "https://github.com/gordienko/ajax_validation"
  s.summary     = "Validations with ajax."
  s.description = "It will handle ajax validations."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"

end
