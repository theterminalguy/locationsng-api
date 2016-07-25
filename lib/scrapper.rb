






url = 'http://www.nigeriapostcodes.com/index.php/welcome/'


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


def easy_shell 
require 'readline'
while input = Readline.readline("> ", true)
  break if input == "exit"
 
  system(input)
end
end 
