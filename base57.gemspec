Gem::Specification.new do |s|
  s.name     = "base57"
  s.version  = "0.1"
  s.platform = Gem::Platform::RUBY
  s.homepage = "http://github.com/wyattisimo/base57-ruby"
  s.summary  = "Base57 conversion."
  s.author   = "Jared Wyatt"
  s.email    = "j@wyatt.co"
  s.license  = "MIT"
  
  s.files        = Dir.glob("lib/*") + %w(LICENSE README.md)
  s.require_path = "lib"
end
