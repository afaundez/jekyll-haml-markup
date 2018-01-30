# frozen_string_literal: true
require 'jekyll/haml_renderer'
require_relative 'haml_renderer/file'
require_relative 'haml_renderer/table'

module Jekyll
  class HamlRenderer
    def initialize(site)
      @site = site
      # Haml::Template.error_mode = @site.config["haml"]["error_mode"].to_sym
      reset
    end

    def reset
      @stats = {}
    end

    def file(filename)
      filename = @site.in_source_dir(filename).sub(
        %r!\A#{Regexp.escape(@site.source)}/!,
        ""
      )

      HamlRenderer::File.new(self, filename).tap do
        @stats[filename] ||= new_profile_hash
        @stats[filename][:count] += 1
      end
    end

    def increment_bytes(filename, bytes)
      @stats[filename][:bytes] += bytes
    end

    def increment_time(filename, time)
      @stats[filename][:time] += time
    end

    def stats_table(n = 50)
      HamlRenderer::Table.new(@stats).to_s(n)
    end

    def self.format_error(e, path)
      "#{e.message} in #{path}"
    end

    private
    def new_profile_hash
      Hash.new { |hash, key| hash[key] = 0 }
    end
  end
end
