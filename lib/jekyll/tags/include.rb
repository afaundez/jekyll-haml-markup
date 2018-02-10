require 'jekyll/tags/include'
require 'jekyll/converters/haml'

module Jekyll
  module Tags
    class IncludeTag < Liquid::Tag

      def read_file(file, context)
        content = File.read file, file_read_opts(context)

        config = context.registers[:site].config
        haml_converter = Jekyll::Converters::Haml.new config
        content = haml_converter.convert(content) if haml_converter.matches File.extname(file)

        content
      end

    end
  end
end
