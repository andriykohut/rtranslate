Gem::Specification.new do |s|
  s.name    = 'rtranslate'
  s.version = '0.0.1'
  s.executables << 'rtranslate'
  s.date    = '2014-03-28'
  s.summary = 'Simple CLI translator for Google Translate'
  s.author  = ['Andrii Kohut']
  s.email   = 'andriy.kogut@gmail.com'
  s.files   = ['lib/translate.rb', 'lib/parser.rb']
  s.license = 'MIT'
  s.add_runtime_dependency 'colorize', '~> 0'
end
