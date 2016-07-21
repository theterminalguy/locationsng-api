module Api 
  module V1 
    class CitiesController < ApplicationController
      def index 
        @cities = LocationsNg::City.new.all

        render json: @cities
      end 
    end 
  end 
end 
