require 'jekyll'

module Jekyll
  module Converters
    # haml converter
    class Haml < Converter
      def extname_list
        @extname_list ||= haml_conf['haml_ext'].split(',').map do |e|
          ".#{e.downcase}"
        end
      end

      def matches(ext)
        extname_list.include?(ext.downcase)
      end

      def output_ext(_ext)
        '.html'
      end

      def processor
        case haml_conf['haml'].downcase
        when 'lib-haml' then Jekyll::Haml::Parser.new haml_conf
        end
      end

      def convert(content)
        processor.convert content
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
