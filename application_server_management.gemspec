require_relative "lib/application_server_management/version"

Gem::Specification.new do |spec|
  spec.name        = "application_server_management"
  spec.version     = ApplicationServerManagement::VERSION
  spec.authors     = ["nitishkumargupta"]
  spec.email       = ["nitishkumargupta@outlook.in"]
  spec.homepage    = "https://github.com/nitishkumargupta/application_server_management"
  spec.summary     = "Summary of ApplicationServerManagement."
  spec.description = "Description of ApplicationServerManagement."
    spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nitishkumargupta/application_server_management"
  spec.metadata["changelog_uri"] = "https://github.com/nitishkumargupta/application_server_management"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4.3"
end
