require 'test_helper'
require 'nokogiri'

describe Jekyll::Haml::Markup do
  before do
    options = {}
    options['source'] = source_dir('sites', 'nested')
    @destination = Dir.mktmpdir 'nested', dest_dir
    options['destination'] = @destination
    config = Jekyll::Configuration::DEFAULTS.merge options
    @site = fixture_site config
    @site.process
  end

  after do
    FileUtils.remove_entry @destination
  end

  it 'should load a neasted site' do
    xslt = Nokogiri::XSLT xls
    html = Nokogiri::HTML File.read File.join(@destination, 'index.html')
  end
end
