class State < ActiveRecord::Base 
  belongs_to :zone 
  has_many :towns 
  has_many :rural_lgas 
end 
