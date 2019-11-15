
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/haml/markup/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-haml-markup"
  spec.version       = Jekyll::Haml::Markup::VERSION
  spec.authors       = ["Alvaro Faundez"]
  spec.email         = ["alvaro@faundez.net"]

  spec.summary       = %q{Jekyll plugin to use Haml on templates.}
  spec.description   = %q{Jekyll plugin that add the option to write layouts and partials in Haml.}
  spec.homepage      = 'https://github.com/afaundez/jekyll-haml-markup'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.1.0'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'

  spec.add_runtime_dependency 'jekyll', '>= 3.0', '< 5.0'
  spec.add_runtime_dependency 'haml', '~> 5.0', '>= 5.0.0'
end
