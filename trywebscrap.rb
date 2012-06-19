#!/usr/bin/ruby -w

require 'rubygems'
require 'nokogiri' 
require 'open-uri'
  

page = Nokogiri::HTML(open("http://simplyrecipes.com/"))   
#puts page.class   # => Nokogiri::HTML::Document

 links = page.css('a')
 puts links.length 

hrefs = links.map{ |link|   link['href'] }
#puts hrefs

doc_hrefs = hrefs.select{ |href|  href.match("http://www.simplyrecipes.com/subject-index.php") != nil}
puts "new page is :#{doc_hrefs}"
#puts doc_hrefs.to_s

arr=[]
page1 = Nokogiri::HTML(open(doc_hrefs.to_s))
page1.search("//*[@id='content-inner']/div[1]/div/div/p[1]/a").each{|x| arr.push(x.attribute("href"))}
#puts arr

puts len = arr.length

arrALink=[]
for i in 1..len-1
#puts "link number : #{i}"
page2 = Nokogiri::HTML(open(arr[i]))
page2.search("//*[@id='content-inner']/div[1]/div/div/div/div/div[1]/div[1]/a").each{|z| arrALink.push(z.attribute("href"))}
end
puts "content of arrALink are:"
puts arrALink

#arrRecipeLink=[]
#arrALinkLen = arrALink.length
#for j in 0..arrALinkLen-1
#puts "link number : #{j}"
# page3 = Nokogiri::HTML(open(arrALink[j]))
#puts page3.search("//*[@id='content-inner']/div[1]/div/div/div/div/div[1]/div[1]/a").each{|y| arrRecipeLink.push(y.attribute("href"))}
#end
#puts arrRecipeLink

#for k in 0..5
#page4 = Nokogiri::HTML(open(arrRecipeLink[k]))
#puts page4.search("//*[@id='entry-individual']/div[2]/span/h1").text
#puts page4.search("//*[@id='recipe-intro']/p").text
#puts page4.search("//*[@id='recipe-ingredients']/h3").text
#puts page4.search("//*[@id='recipe-method']").text
#end







