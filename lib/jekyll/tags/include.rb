require 'jekyll/tags/include'

# frozen_string_literal: true

module Jekyll
  module Tags
    class IncludeTag < Liquid::Tag

      def read_file(file, context)
        ::Haml::Engine.new(File.read(file, file_read_opts(context))).render
      end

    end
  end
end
