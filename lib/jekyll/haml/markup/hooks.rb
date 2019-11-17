require 'jekyll'

Jekyll::Hooks.register :site, :post_read do |site|
  haml_converter = Jekyll::Converters::Haml.new site.config
  site.layouts.each do |_, layout|
    if haml_converter.matches layout.ext
      layout.content = Jekyll::Haml::Parser.compile layout.content
    end
  end
end
