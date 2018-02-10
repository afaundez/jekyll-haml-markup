require 'jekyll/configuration'
# frozen_string_literal: true

module Jekyll
  class Configuration < Hash
    # Default options. Overridden by values in _config.yml.
    # Strings rather than symbols are used for compatibility with YAML.
    DEFAULTS = Configuration[{
      'haml_ext' => 'haml',
      'haml' => 'lib-haml',
      'lib-haml' => {
        attr_wrapper: '"',
        escape_attrs: false
      },

      # Where things are
      "source"              => Dir.pwd,
      "destination"         => File.join(Dir.pwd, "_site"),
      "collections_dir"     => "",
      "plugins_dir"         => "_plugins",
      "layouts_dir"         => "_layouts",
      "data_dir"            => "_data",
      "includes_dir"        => "_includes",
      "collections"         => {},

      # Handling Reading
      "safe"                => false,
      "include"             => [".htaccess"],
      "exclude"             => %w(
        Gemfile Gemfile.lock node_modules vendor/bundle/ vendor/cache/ vendor/gems/
        vendor/ruby/
      ),
      "keep_files"          => [".git", ".svn"],
      "encoding"            => "utf-8",
      "markdown_ext"        => "markdown,mkdown,mkdn,mkd,md",
      "strict_front_matter" => false,

      # Filtering Content
      "show_drafts"         => nil,
      "limit_posts"         => 0,
      "future"              => false,
      "unpublished"         => false,

      # Plugins
      "whitelist"           => [],
      "plugins"             => [],

      # Conversion
      "markdown"            => "kramdown",
      "highlighter"         => "rouge",
      "lsi"                 => false,
      "excerpt_separator"   => "\n\n",
      "incremental"         => false,

      # Serving
      "detach"              => false, # default to not detaching the server
      "port"                => "4000",
      "host"                => "127.0.0.1",
      "baseurl"             => nil, # this mounts at /, i.e. no subdirectory
      "show_dir_listing"    => false,

      # Output Configuration
      "permalink"           => "date",
      "paginate_path"       => "/page:num",
      "timezone"            => nil, # use the local timezone

      "quiet"               => false,
      "verbose"             => false,
      "defaults"            => [],

      "liquid"              => {
        "error_mode" => "warn",
      },

      "rdiscount"           => {
        "extensions" => [],
      },

      "redcarpet"           => {
        "extensions" => [],
      },

      "kramdown"            => {
        "auto_ids"      => true,
        "toc_levels"    => "1..6",
        "entity_output" => "as_char",
        "smart_quotes"  => "lsquo,rsquo,ldquo,rdquo",
        "input"         => "GFM",
        "hard_wrap"     => false,
        "footnote_nr"   => 1,
        "show_warnings" => false,
      },
    }.map { |k, v| [k, v.freeze] }].freeze
  end
end
