# Jekyll Haml Markup

[Jekyll](https://jekyllrb.com) plugin that enables [Haml](http://haml.info) as a markup option for layouts, partials, and pages.

## Installation

Add to your Gemfile:

```ruby
gem 'jekyll-haml-markup', group: :jekyll_plugins
```

## Usage

Name your layouts, partials, and pages with the `.haml` extension. This plugin intercepts the default `include` and compile your Haml template to HTML.

## Development
This gem uses a hook for Haml layouts compiling, modifies the `include` tag, and add a Haml converter.

There are lots of border cases that have to be tested before production use.

I started this gem because I couldn't make work the [jekyll-haml](https://github.com/samvincent/jekyll-haml) gem, which seems inactive.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/afaundez/jekyll-haml-markup. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Haml::Markup project’s codebases, issue trackers, chat rooms, and mailing lists are expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-haml-markup/blob/master/CODE_OF_CONDUCT.md).
