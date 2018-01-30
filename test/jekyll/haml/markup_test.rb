require 'test_helper'

class Jekyll::Haml::MarkupTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Haml::Markup::VERSION
  end
end
