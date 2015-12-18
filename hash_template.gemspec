Gem::Specification.new do |s|
  s.name        = 'hash_template'
  s.version     = '0.1'
  s.date        = Date.today
  s.summary     = 'Transform a flat hash to a structured hash using template.'
  s.description = s.summary
  s.authors     = ['Denis Peplin']
  s.email       = 'denis.peplin@gmail.com'
  s.files       = ['lib/hash_template.rb']
  s.homepage    = 'http://github.com/denispeplin/hash_template'
  s.license     = 'MIT'

  s.required_ruby_version = '~> 2.0'
  s.add_development_dependency 'rspec', '~> 3.0'
end
