module Api 
  module V1 
    class StatesController < ApplicationController
      before_action :set_ng_state, only: [:index, :details, :capital]
      def index 
        if params[:id]
          state = State.find(params[:id]) 
          render json: state 
        elsif params[:state_code] 
          state = State.find_by_code(params[:state_code].upcase)
          render json: state
        elsif params[:state_name] 
          state = State.find_by_name(params[:state_name].capitalize)
          render json: state
        else 
          render json: @ng_state.all
        end 
      end 

      def show 
        state = State.find(params[:id])

        render json: state
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
        @ng_state =  LocationsNg::State.new 
      end 

      def state_params 
        params.permit(:state)
      end 
    end 
  end 
end 
