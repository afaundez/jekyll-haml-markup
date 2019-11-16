require 'jekyll'
require 'liquid'

module Jekyll
  module Tags
    # include module
    class HamlInclude < IncludeTag
      def read_file(file, context)
        site = context.registers[:site]
        haml_converter = Jekyll::Converters::Haml.new site.config
        file_extname = File.extname file
        return super file, context unless haml_converter.matches file_extname
        file_content = File.read file, file_read_opts(context)
        file_parts = file_content.split(/(---\n)/)
        file_parts.push(haml_converter.convert(file_parts.pop)).join
      end
    end
  end
end

Liquid::Template.register_tag 'include', Jekyll::Tags::HamlInclude
