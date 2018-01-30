require 'jekyll/converter'
require 'jekyll/haml/parser'

module Jekyll
  module Converters
    class Haml < Identity
      safe true

      def extname_list
        @extname_list ||= @config["haml_ext"].split(",").map do |e|
          ".#{e.downcase}"
        end
      end

      def matches(ext)
        extname_list.include?(ext.downcase)
      end

      def output_ext(ext)
        '.html'
      end

      def get_processor
        case @config["haml"].downcase
        when "lib-haml" then return Jekyll::Haml::Parser.new(@config)
        end
      end
      
      def convert(content)
        get_processor.convert content
      end
    end
  end
end
