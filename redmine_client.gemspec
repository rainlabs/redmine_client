# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redmine_client/version'

Gem::Specification.new do |spec|
  spec.name          = "redmine_client"
  spec.version       = RedmineClient::VERSION
  spec.authors       = ["Vladimir Zyablitskiy", "Eric Davis"]
  spec.email         = ["zyablitskiy@gmail.com", "edavis@littlestreamsoftware.com"]
  spec.summary       = %Q{Redmine API client}
  spec.description   = %Q{Access the Redmine REST API with ActiveResource}
  spec.homepage      = "http://github.com/rainlabs/redmine_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activeresource"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "thoughtbot-shoulda"
end
