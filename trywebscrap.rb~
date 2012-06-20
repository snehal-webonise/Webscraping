#!/usr/bin/ruby -w

require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'hpricot'
require 'active_record'
 
ActiveRecord::Base.establish_connection(
    :adapter  => 'mysql',
    :host     => 'localhost',
    :username => 'root',
    :password => 'root',
    :database => 'scraping_db') 

class Recipedata < ActiveRecord::Base

end 

class Scrap
page = Nokogiri::HTML(open("http://simplyrecipes.com/"))   


 links = page.css('a')
 puts links.length 

hrefs = links.map{ |link|   link['href'] }


doc_hrefs = hrefs.select{ |href|  href.match("http://www.simplyrecipes.com/subject-index.php") != nil}
puts "new page is :#{doc_hrefs}"


arr=[]
page1 = Nokogiri::HTML(open(doc_hrefs.to_s))
page1.search("//*[@id='content-inner']/div[1]/div/div/p[1]/a").each{|x| arr.push(x.attribute("href"))}


puts len = arr.length

arrALink=[]
for i in 0..len-1
#puts "link number : #{i}"
page2 = Nokogiri::HTML(open(arr[i]))
page2.search("//*[@id='content-inner']/div[1]/div/div/div/div/div/div[2]/a").each{|z| arrALink.push(z.attribute("href"))}
end
puts "content of arrALink are:"
puts arrALink

#arrRecipeLink=[]
arrALinkLen = arrALink.length
for j in 0..5
#puts "link number : #{j}"
page3 = Nokogiri::HTML(open(arrALink[j]))
recipetitle = page3.search("//*[@id='entry-individual']/div[2]/span/h1").text
puts "Title : "+recipetitle
puts
description = page3.search("//*[@id='recipe-intro']/p").text
puts "Description :"+description
puts
ingredians = page3.search("//*[@id='recipe-ingredients']/ul").text
puts "Ingredians : "+ingredians
puts
method = page3.search("//*[@id='recipe-method']").text
puts "Method : "+method
puts
putdata = Recipedata.new(:Title=>recipetitle,:Description=>description,:Ingredians=>ingredians,:Method=>method)
putdata.save
end
end








