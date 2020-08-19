require 'jekyll'
require 'liquid'

module Jekyll
  module Tags
    # include module
    class HamlInclude < IncludeTag
      def read_file(file, context)
        return super file, context unless matches_a_haml_template file
        file_content = read_file_with_context file, context
        template = split_frontmatter_and_template file_content
        compile_haml_to_html template
      end

      private

      def matches_a_haml_template(file)
        Jekyll::Haml::Parser.matches File.extname file
      end

      def read_file_with_context(file, context)
        File.read file, **file_read_opts(context)
      end

      def split_frontmatter_and_template(file_content)
        return $POSTMATCH if file_content =~ Document::YAML_FRONT_MATTER_REGEXP
        file_content
      end

      def compile_haml_to_html(template)
        Jekyll::Haml::Parser.compile template
      end
    end
  end
end

Liquid::Template.register_tag 'include', Jekyll::Tags::HamlInclude
