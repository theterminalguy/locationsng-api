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
        nokogiri = "nokogiri -e '$_.css(%q(#town-select option)).drop(1).each { |town| print Hash[:state_id, '#{i}', :id, town.values[0], :name, town.content], %q(, \n) }'"

        cmd = " >> 'data/all_towns.txt'"

        system curl + nokogiri + cmd 
      end 
    end

    def areas 
      url = "#{@host}ajax/getUrbanAreas/"
      areas = (601..700).to_a 
      areas.each do |i| 
        puts "Loading...#{i} of #{areas.count}"        
        curl = "curl -X POST -d 'town_id=#{i}' #{url} | "
        nokogiri = "nokogiri -e '$_.css(%q(#area-select option)).drop(1).each{ |area| print Hash[:town_id, '#{i}', :id, area.values[0], :name, area.content], %q(, \n)}'"

        cmd = " >> 'data/all_areas.txt'"

        system curl + nokogiri + cmd  
      end 
    end 

    def streets 
      url = "#{@host}ajax/getUrbanStreets/"    
      areas = (1001..1340).to_a 
      areas.each do |i| 
        puts "Loading...#{i} of 1000 number of record is #{areas.count}"

        curl = "curl -X POST -d 'area_id=#{i}' #{url} | "
        nokogiri = "nokogiri -e '$_.css(%q(#street-select option)).drop(1).each { |street| print Hash[:area_id, '#{i}', :id, street.values[0], :name, street.content], %q(, \n)}'"

        cmd = " >> 'data/all_streets.txt'"

        system curl + nokogiri + cmd 
      end 

    end 
  end 
end


