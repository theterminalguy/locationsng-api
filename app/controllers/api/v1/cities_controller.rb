module Api 
  module V1 
    class CitiesController < ApplicationController
      def index 
        render json: LocationsNg::City.all
      end 
    end 
  end 
end 
