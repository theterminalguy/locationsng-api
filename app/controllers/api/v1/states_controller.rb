module Api 
  module V1 
    class StatesController < ApplicationController
      before_action :set_ng_state, only: [:index, :details, :capital]
      def index 
        render json: @ng_state.all
      end 

      def details 
        render json: @ng_state.details(params[:state])
      end 

      def capital 
        render json: @ng_state.capital(params[:state])
      end 

      def cities 
        @state_cities = LocationsNg::City.new.cities(params[:state])

        render json: @state_cities
      end 

      def lgas 
        @state_lgas = LocationsNg::Lga.new.lgas(params[:state])

        render json: @state_lgas
      end 

      private 

      def set_ng_state 
        @ng_state =  LocationsNg::State
      end 

      def state_params 
        params.permit(:state)
      end 
    end 
  end 
end 
