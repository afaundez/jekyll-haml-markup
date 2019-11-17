require 'haml'

module Jekyll
  module Haml
    # parse module
    class Parser
      CONFIG = { attr_wrapper: '"', escape_attrs: false }.freeze

      def self.matches(ext)
        ext =~ /^\.haml$/i
      end

      def self.compile(content)
        template = ::Haml::Engine.new content, CONFIG
        template.render.split("\n").join
      end
    end
  end
end
