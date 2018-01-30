require 'jekyll/convertible'

module Jekyll
  module Convertible

    def haml_file?
      %w(.haml).include?(ext)
    end

    def render_with_haml?
      haml_file?
    end

  end
end
