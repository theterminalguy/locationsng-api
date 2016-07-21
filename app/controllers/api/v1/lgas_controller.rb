module Api 
  module V1 
    class LgasController < ApplicationController
      def index
        render json: LocationsNg::Lga.all
      end 
    end 
  end 
end 
