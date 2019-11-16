require 'jekyll'

Jekyll::Hooks.register :site, :post_read do |site|
  haml_converter = Jekyll::Converters::Haml.new site.config
  site.layouts.each do |_, layout|
    if haml_converter.matches layout.ext
      parsed_content = haml_converter.convert layout.content
      layout.content = parsed_content
    end
  end
end
