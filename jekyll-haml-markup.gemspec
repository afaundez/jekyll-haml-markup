
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-haml-markup/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-haml-markup"
  spec.version       = Jekyll::Haml::Markup::VERSION
  spec.authors       = ["Alvaro Faundez"]
  spec.email         = ["alvaro@faundez.net"]

  spec.summary       = %q{Jekyll plugin to use Haml on templates.}
  spec.description   = %q{Jekyll plugin that add the option to write layouts and partials in Haml.}
  spec.homepage      = 'https://github.com/afaundez/jekyll-haml'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_runtime_dependency 'jekyll', '~> 3.7'
  spec.add_runtime_dependency 'haml', '~> 5.0'
end
