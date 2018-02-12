# Jekyll Haml Markup

[Jekyll](https://jekyllrb.com) plugin that enables [Haml](http://haml.info) as a markup option for layouts and partials.

**Note**: This gem overwrites the `include` jekyll tag.

## Installation

Add it to your Gemfile:

```ruby
gem 'jekyll-haml-markup', group: :jekyll_plugins
```

## Usage

You just need to save your layout or template with extension `.haml`, replacing any other extension.

The layout haml markup is rendered with hooks before the [Liquid](http://shopify.github.io/liquid/) render phase and modify version of the `include` tag is in charge of the partials.

```haml
!!!
%html
  %head
    %title Fake title
    %link{href: "{{ '/assets/css/style.css?v=' | append: site.github.build_revision | relative_url }}", rel: "stylesheet", type: 'text/css'}
    %link(href="{{ '/assets/css/style.css?v=' | append: site.github.build_revision | relative_url }}" rel="stylesheet" type='text/css')
  %body
    %header
      {% include header.haml  %}
    %main
      {{ content }}
    %footer
      {% include footer.html  %}
    %script{src: "{{ '/assets/javascript/script.css?v=' | append: site.github.build_revision | relative_url }}"}
```

Front-matter headers are not working on partials.

## Development

I started this gem because I couldn't make work the gem [jekyll-haml](https://github.com/samvincent/jekyll-haml).

At this moment, this gem just works overriding [Jekyll](https://github.com/jekyll/jekyll) classes and methods. It's not a stable option and it has to be reviewed. If you want to help, just email me.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/afaundez/jekyll-haml-markup. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Haml::Markup project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-haml-markup/blob/master/CODE_OF_CONDUCT.md).
