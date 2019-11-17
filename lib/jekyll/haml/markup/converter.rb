require 'jekyll'

module Jekyll
  module Converters
    # haml converter
    class Haml < Converter
      def matches(ext)
        Jekyll::Haml::Parser.matches ext
      end

      def output_ext(_ext)
        '.html'
      end

      def convert(content)
        Jekyll::Haml::Parser.compile content
      end
    end
  end
end
