
curl -s https://nycuncubedspring15.splashthat.com | sed -n '/sfid-2694687/,/sfid-2694770/p' | grep '<a href="http' | awk ' {print $2}' | cut -d '"' -f 2 > names.txt






url = 'http://www.nigeriapostcodes.com/index.php/welcome/'



#page.css("#state-select option").map {|item| item.content }


for i in 1..37 do 
  system 'curl -X POST -d "state_id=" http://nigeriapostcodes.com/index.php/ajax/getUrbanTown/'
end 


require 'nokogiri'
require 'open-uri'

@url = 'http://www.nigeriapostcodes.com/index.php/welcome/'

def states 
  page = Nokogiri::HTML(open(@url))
  page.css("#state-select option").map {|item| item.content }
end 

def town
  host = "http://nigeriapostcodes.com/index.php/ajax/"
  for i in 1..37 do 
    puts "Loading...#{i} of 37"
    system "curl -X POST -d 'state_id=#{i}' #{host}/getUrbanTown >> urban_town.txt" 
  end 
end 



module Scrapper 
  class Urban
    
    def areas 

    end 

    def street 

    end 
  end 
end 
