require 'jekyll/tags/include'

module Jekyll
  module Tags
    class IncludeTag < Liquid::Tag

      def read_file(file, context)
        ::Haml::Engine.new(File.read(file, file_read_opts(context))).render
      end

    end
  end
end
