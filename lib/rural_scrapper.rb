require 'nokogiri'
require 'open-uri'

module Scrapper
  class Rural 

    def initialize 
      @host = "http://nigeriapostcodes.com/index.php/"
    end 

    def lgas
      url = "#{@host}getRuralLGA/"
      states = (1..37).to_a 

      states.each do |id|
        puts "Loading...#{id} of 37"

        curl = "curl -X POST -d 'state_id=#{id}' #{url} |"
        nokogiri = "nokogiri -e '$_.css(%q(#lga-select option)).drop(1).each { |lga| print Hash[:state_id, '#{id}', :id, lga.values[0], :name, lga.content], %q(, \n)}'"

        cmd = " >> 'data/rural/all_lgas.txt'"

        system curl + nokogiri + cmd 
      end 
    end 

    # def districts
    #   url = "#{@host}ajax/getRuralDistrict/"
    #   lgas = (501..679).to_a  
    #   len = lgas.last 
    #   lgas.each do |id| 
    #     puts "Loading...#{id} of #{len}"
    #     curl = "curl -X POST -d 'lga_id=#{id}' #{url} | "
    #     nokogiri = "nokogiri -e '$_.css(%q(#district-select option)).drop(1).each { |data| print Hash[:lga_id, '#{id}', :id, data.values[0], :name, data.content], %q(, \n)}'"

    #     cmd = " >> 'data/rural/all_districts.txt'"

    #     system curl + nokogiri + cmd 
    #   end 
    # end 

    def towns 
      url = "#{@host}ajax/getRuralDistrictTown/"
      districts = (2401..2795).to_a 
      len = districts.last 

      districts.each do |id| 
        puts "Loading...#{id} of #{len}"

        curl = "curl -X POST -d 'district_id=#{id}' #{url} | "
        nokogiri = "nokogiri -e '$_.css(%q(#town-select option)).drop(1).each { |data| print Hash[:district_id, '#{id}', :id, data.values[0], :name, data.content], %q(, \n) }'"

        cmd = " >> 'data/rural/all_towns.txt'"

        system curl + nokogiri + cmd 
      end 

      puts "*" * 100 
      puts "Start at #{districts.first} Stop at #{len}"
    end 

     def postcodes 
      url = "#{@host}welcome/getRuralPostCode"
      districts = (2601..2792).to_a 
      len = districts.last 
      districts.each do |id| 
        puts "Loading...#{id} of #{len}"

        curl = "curl -X POST -d 'district-id=#{id}' #{url} | "
        nokogiri = "nokogiri -e 'towns = $_.css(%q(#postcode_result div span)).drop(1).map { |i| i.content.strip }; code = $_.css(%q(#postcode_result div))[2].content; print Hash[:district_id, '#{id}', :code, code.delete(%q(^0-9)), :towns, towns], %q(, \n)'"

        cmd = " >> 'data/rural/postcodes.txt'"

        system curl + nokogiri + cmd 
      end 


      puts "*" * 100 
      puts "Start at #{districts.first} Stop at #{len}"
    end  

  end 
end

