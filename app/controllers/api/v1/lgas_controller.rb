module Api 
  module V1 
    class LgasController < ApplicationController
      def index 
        @lgas = LocationsNg::Lga.new.all

        render json: @lgas 
      end 
    end 
  end 
end 
