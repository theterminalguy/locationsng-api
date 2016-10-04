module Api 
  module V1 
    class StatesController < ApplicationController
      before_action :set_ng_state, only: [:index, :details, :capital]
      before_action :set_state, only: [:index, :urban_streets, :local_gov ]

      def index 
       unless @state 
         render json: @ng_state.all
       else 
         render json: @state
       end 
      end 

      def zone 
        state_zone = if params[:zone_code]
           Zone.find_by_code(params[:zone_code].downcase)
                     elsif params[:zone_id]
           Zone.find(params[:id].downcase)
                     end 

        unless state_zone 
          render json: {message: "Please provide zone id or zone code"} 
        else 
          render json: state_zone.states
        end 
      end 

      def urban_streets 
        @state.towns.first.areas.first.streets
        towns_id = @state.towns.pluck(:id)  
        areas_id = Area.where(town_id: towns_id).pluck(:id) 
        streets = Street.where(area_id: areas_id) 
       
        render json: streets  
      end 

      def urban_postcode 
        area = Area.find(params[:area_id]) 

        render json: area.post_code
      end 

      def local_gov 
        render json: @state.rural_lgas
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

      #def lgas 
      #  @state_lgas = LocationsNg::Lga.new.lgas(params[:state])

      #  render json: @state_lgas
      #end 

      private 

      def set_ng_state 
        @ng_state =  LocationsNg::State.new 
      end 

      def set_state 
       @state =  if params[:id]
          State.find(params[:id]) 
        elsif params[:state_code] 
          State.find_by_code(params[:state_code].upcase)
        elsif params[:state_name] 
         State.find_by_name(params[:state_name].capitalize)
        end 
      end 

      def state_params 
        params.permit(:state)
      end 
    end 
  end 
end 
