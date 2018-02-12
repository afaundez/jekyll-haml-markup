require 'haml'

module Jekyll
  module Haml
    class Parser

      def initialize(config)
        unless defined?(Haml)
          Jekyll::External.require_with_graceful_fail "haml"
        end
        @config = config["lib-haml"] || {}
        setup
      end

      def setup
        make_accessible
      end

      def convert(content)
        document = ::Haml::Engine.new(content, @config)
        html_output = document.render
        if @config["show_warnings"]
          document.warnings.each do |warning|
            Jekyll.logger.warn "Haml warning:", warning
          end
        end
        html_output
      end

      private
      def make_accessible(hash = @config)
        hash.keys.each do |key|
          hash[key.to_sym] = hash[key]
          make_accessible(hash[key]) if hash[key].is_a?(Hash)
        end
      end

    end
  end
end
