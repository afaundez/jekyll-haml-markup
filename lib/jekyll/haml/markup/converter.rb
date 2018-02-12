require 'jekyll'

module Jekyll
  module Converters
    class Haml < Converter

      def extname_list
        @extname_list ||= haml_conf["haml_ext"].split(",").map do |e|
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
        case haml_conf['haml'].downcase
        when 'lib-haml' then return Jekyll::Haml::Parser.new haml_conf
        end
      end

      def convert(content)
        get_processor.convert content
      end

      def haml_conf
        {
          'haml_ext' => 'haml',
          'haml' => 'lib-haml',
          'lib-haml' => {
            attr_wrapper: '"',
            escape_attrs: false
          }
        }
      end
    end
  end
end
