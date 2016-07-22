require 'nokogiri'
require 'open-uri'

module Scrapper
  class Urban 

    def initialize 
      @host = "http://nigeriapostcodes.com/index.php/"
    end 

    def states 
      url = "#{@host}welcome/"
      page = Nokogiri::HTML(open(url))
      page.css("#state-select option").map {|item| item.content }
    end 
  
    def towns
      url = "#{@host}ajax/getUrbanTown/"
      len = states.length 

      states.each.with_index do |state, i|
        puts "Loading...#{i} of #{len}"
        curl = "curl -X POST -d 'state_id=#{i}' #{url} | "
        nokogiri = "nokogiri -e '$_.css(%q(#town-select option)).each { |town|  puts town.values[0] + %q(=>) + town.content }'"
         
          obj = Town.new(state_id: i, name: town.content, cid: town values[0])

        cmd = " >> 'data/towns_in_#{state}.txt'"

        system curl + nokogiri + cmd 
      end 
    end 


    def area(id)
      url = "#{@host}ajax/getUrbanAreas/"
      system "curl -X POST -d 'town_id=#{i}' #{url} >> areas_in_#{town}.txt" 
      id
    end 

    def street(id) 
      url = "#{@host}ajax/getUrbanStreets/"
      system "curl -X POST -d 'area_id=#{i}' #{url} >> streets_in_#{area}.txt" 
    end

    def areas
      url = "#{@host}ajax/getUrbanAreas/"

      len = towns.length 

      towns.each.with_index do |town, i|
        puts "Loading...#{i} of #{len}"
        system "curl -X POST -d 'state_id=#{i}' #{url} >> areas_in_#{town}.txt" 
      end 
    end 

    def streets 
      url = "#{@host}ajax/getUrbanStreets/"
      len = areas.length 

      areas.each.with_index do |area, i| 
        puts "Loading...#{i} of #{len}"
        system "curl -X POST -d 'state_id=#{i}' #{url} >> streets_in_#{area}.txt" 
      end 
    end 
  end 
end
