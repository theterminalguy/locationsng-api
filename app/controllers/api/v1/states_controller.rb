module Api 
  module V1 
    class StatesController < ApplicationController
      def index 
        render json: set_ng_state.all
      end 

      def details 
        render json: set_ng_state.details(params[:state])
      end 

      def capital 
        render json: set_ng_state.capital(params[:state])
      end 

      def cities
        render json: LocationsNg::City.cities(params[:state])
      end 

      def lgas 
        render json: LocationsNg::Lga.lgas(params[:state])
      end 

      private 

      def set_ng_state 
        LocationsNg::State
      end 

      def state_params 
        params.permit(:state)
      end 
    end 
  end 
end 
