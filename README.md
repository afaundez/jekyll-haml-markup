# JEKYLL-HAML-MARKUP

[Jekyll](https://jekyllrb.com) plugin that enables [Haml](http://haml.info) as a markup option for layouts and partials.

## Installation

Add it to your Gemfile:

```ruby
gem 'jekyll-haml-markup', group: :jekyll_plugins
```

## Usage

You just need to save your layout or template with extension `.haml`, replacing any other extension.

The haml markup will be rendered before the [Liquid](http://shopify.github.io/liquid/) parsing, that means that you will need to escape with `\` any line that doesn't match haml syntax. For example:

```haml
!!!
%html
  %head
    \{% asset style.css %}
  %body
    \{{ content }}
```

## Development

I started this gem because I couldn't make work the gem [jekyll-haml](https://github.com/samvincent/jekyll-haml).

At this moment, this gem just works overriding [Jekyll](https://github.com/jekyll/jekyll) classes and methods. It's not a stable option and it has to be reviewed. If you want to help, just email me.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/afaundez/jekyll-haml-markup. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Haml::Markup project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-haml-markup/blob/master/CODE_OF_CONDUCT.md).
