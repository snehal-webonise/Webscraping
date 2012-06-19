#!/usr/bin/ruby -w

require 'rubygems'
require 'mechanize'
require 'nokogiri'

agent = Mechanize.new
page = agent.get('http://google.com/')
google_form = page.form('f')
google_form.q = 'ruby mechanize'
page = agent.submit(google_form)
#pp page

puts agent.get('http://google.com/').search(".//p[@class='posted']")
