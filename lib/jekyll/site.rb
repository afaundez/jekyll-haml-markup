require 'jekyll/site'

module Jekyll
  class Site
    attr_reader :haml_renderer

    alias_method :pre_haml_initialize, :initialize

    def initialize(config)
      pre_haml_initialize(config)
      @haml_renderer = HamlRenderer.new(self)
    end
  end
end
