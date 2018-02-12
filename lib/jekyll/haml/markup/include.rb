require 'jekyll'
require 'liquid'

module Jekyll
  module Tags
    class HamlInclude < IncludeTag

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

Liquid::Template.register_tag 'include', Jekyll::Tags::HamlInclude
