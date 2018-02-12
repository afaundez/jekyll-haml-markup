require_relative 'markup/version'
require_relative 'markup/parser'
require_relative 'markup/converter'
require_relative 'markup/include'
require_relative 'markup/hooks'

module Jekyll
  module Haml
    module Markup
      def self.root
        Pathname.new File.expand_path('../../../..', __FILE__)
      end
    end
  end
end
