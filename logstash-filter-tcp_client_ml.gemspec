Gem::Specification.new do |s|
  s.name          = 'logstash-filter-tcp_client_ml'
  s.version       = '0.1.0'
  s.licenses      = ['Apache-2.0']
  s.summary       = 'Write a short summary, because Rubygems requires one.'
  s.description   = 'Write a longer description or delete this line.'
  s.homepage      = 'https://github.com/devel13/logstash-filter-tcp_client_ml'
  s.authors       = ['devel13']
  s.email         = 'threatrap13@gmail.com'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", "~> 2.0"
  s.add_development_dependency 'logstash-devutils'
end
