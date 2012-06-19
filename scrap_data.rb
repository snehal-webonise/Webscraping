#!/usr/bin/ruby -w

require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter  => 'mysql',
    :host     => 'localhost',
    :username => 'root',
    :password => 'root',
    :database => 'scraping_db')

class Scrap < ActiveRecord::Base
  @url      = "http://www.kumarritesh.com"
  @response = ''
  open(@url, "User-Agent" => "Ruby/#{RUBY_VERSION}"  ) {
 |f|
    @response = f.read
  }

  doc   = Hpricot(@response)
  links = (doc/"/html/body/div[2]/div/div/div/div[2]/a").innerHTML
  puts "#{links} "

  links.each do |link|
    scraplink = Scrap.new(:links => link)
    scraplink.save
    puts "#{link} "
  end
end
