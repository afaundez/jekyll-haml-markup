require 'test_helper'

describe Haml do
  before do
    @haml_converter = Jekyll::Converters::Haml.new
  end

  it 'should render html' do
    @haml_converter.convert('%p test').must_equal "<p>test</p>\n"
    @haml_converter.convert("%p test\n").must_equal "<p>test</p>\n"
  end

  it "should render with escaped quotes" do
    input = <<~HAML
      %link(href="{{ '/assets/css/style.css?v=\\\\\\"12345\\\\\\"' }}" rel="stylesheet" type="text/css")
    HAML

    haml_expected = <<~HAML
      <link href="{{ '/assets/css/style.css?v=\\\"12345\\\"' }}" rel="stylesheet" type="text/css">
    HAML
    haml_output = @haml_converter.convert(input)
    haml_output.must_equal haml_expected

    liquid_expected = <<~HAML
      <link href="/assets/css/style.css?v=\\\"12345\\\"" rel="stylesheet" type="text/css">
    HAML
    liquid_output = Liquid::Template.parse(haml_output).render
    liquid_output.must_equal liquid_expected
  end

end
