require 'jekyll-haml-markup/version'

require 'jekyll'

require_relative 'jekyll/converters/haml'
require_relative 'jekyll/haml/parser'
require_relative 'jekyll/configuration'
require_relative 'jekyll/tags/include'


Jekyll::Hooks.register :site, :post_read do |site|
  haml_converter = Jekyll::Converters::Haml.new site.config
  site.layouts.each do |name, layout|
    if haml_converter.matches layout.ext
      parsed_content = haml_converter.convert layout.content
      layout.content = parsed_content
    end
  end
end

# Jekyll::Hooks.register :pages, :pre_render do |page|
#   haml_converter = Jekyll::Converters::Haml.new page.site.config
#   if haml_converter.matches page.ext
#     parsed_layout = haml_converter.convert page.content
#     page.content = parsed_layout
#   end
# end
#
# Jekyll::Hooks.register :posts, :pre_render do |post|
#   haml_converter = Jekyll::Converters::Haml.new post.site.config
#   if haml_converter.matches post.ext
#     parsed_layout = haml_converter.convert post.content
#     post.content = parsed_layout
#   end
# end
#
# Jekyll::Hooks.register :documents, :pre_render do |document|
#   haml_converter = Jekyll::Converters::Haml.new document.site.config
#   if haml_converter.matches document.ext
#     parsed_layout = haml_converter.convert document.content
#     document.content = parsed_layout
#   end
# end
