class RuralDistrict < ActiveRecord::Base
  belongs_to :rural_lga 
  
  has_many :rural_towns 
  has_one :rural_post_code
end 
