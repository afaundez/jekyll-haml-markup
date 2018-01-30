require 'jekyll-haml-markup/version'

require 'jekyll'
require 'haml'

require_relative 'jekyll/converters/haml'
require_relative 'jekyll/haml/parser'
require_relative 'jekyll/configuration'
require_relative 'jekyll/tags/include'


Jekyll::Hooks.register :site, :post_read do |site|
  site.layouts.each do |name, layout|
    layout.content = ::Haml::Engine.new(layout.content).render if ['.haml'].include? layout.ext
  end
end

Jekyll::Hooks.register :pages, :pre_render do |page|
  page.content = ::Haml::Engine.new(page.content).render if ['.haml'].include? page.ext
end

Jekyll::Hooks.register :posts, :pre_render do |post|
  post.content = ::Haml::Engine.new(post.content).render if ['.haml'].include? post.ext
end

Jekyll::Hooks.register :documents, :pre_render do |document|
  document.content = ::Haml::Engine.new(document.content).render if ['.haml'].include? document.ext
end
