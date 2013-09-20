Gem::Specification.new do |s|
  s.name = "devise_ad_authenticatable"
  s.version = "0.0.1"

  s.authors = ["Nat Williams"]
  s.summary = "Devise auth module for ActiveDirectory"
  s.description = "Authenticate against ActiveDirectory, respecting groups"
  s.email = "nat.williams@gmail.com"
  s.files = Dir['lib/**/*.rb', 'spec/**/*.rb'] + [
    'Rakefile',
    'README.md',
    ".rspec",
    "Gemfile",
    "LICENSE",
    "VERSION",
    "devise_ad_authenticatable.gemspec",
  ]
  s.homepage = "http://github.com/natw/devise_ad_authenticatable"
  s.licenses = ["BSD"]
  s.require_paths = ["lib"]

  s.add_dependency('devise')
  s.add_dependency('adauth')

  s.add_development_dependency('rspec', ["~> 2.8.0"])
  s.add_development_dependency('yard', ["~> 0.7"])
end
