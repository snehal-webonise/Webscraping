class IMDB
require 'rubygems'
require 'hpricot'
require 'open-uri'

def initialize
  @url = 'http://imdb.com/title/tt0335266/';
  @hp = Hpricot(open(@url))
end

def  title
   pp @title = @hp.at("meta[@name='title']")['content']
end

end

obj=IMDB.new
obj.title

