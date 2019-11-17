require 'test_helper'
require 'nokogiri'

describe Jekyll::Haml::Markup do
  before do
    options = {}
    options['source'] = source_dir('sites', 'fake')
    @destination = Dir.mktmpdir 'fake', dest_dir
    options['destination'] = @destination
    config = Jekyll::Configuration::DEFAULTS.merge options
    @site = fixture_site config
    @site.process
  end

  after do
    FileUtils.remove_entry @destination
  end

  it 'should load a complete site' do
    html = Nokogiri::HTML File.read File.join(@destination, 'index.html')
    html.xpath('/html/head').wont_be_empty
    html.xpath('/html/body').wont_be_empty
    html.xpath('/html/body/header/nav/ul/li').size.must_equal 3
    html.xpath('/html/body/header/nav/ul/li/a').size.must_equal 2
    html.xpath('/html/body/header/nav/ul/li/p/a').size.must_equal 1
    html.xpath('/html/body/main/section/article').size.must_equal 2
    html.xpath('/html/body/main/h1').wont_be_empty
    html.xpath('/html/body/footer/div/p').wont_be_empty
    html.xpath('/html/body/script').wont_be_empty
  end
end
