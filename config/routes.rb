Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope path: '/states', controller: :states do 
        get '/', to: "states#index"
        get ':state/details', to: "states#details"
        get ':state/capital', to: "states#capital"  
        get ':state/cities', to: "states#cities"
       # get ':state/lgas', to: "states#lgas"
        get '/zone', to: "states#zone"
        get 'urban/streets', to: "states#urban_streets"
        get 'urban/postcode', to: "states#urban_postcode"
        get 'rural/lgas', to: "states#local_gov"
      end 
      
      resources :cities 
      resources :lgas 
    end
  end

  get '/', :to => redirect('/docs/index.html')
  match '*url', to: 'errors#invalid_route', via: :all 
end
