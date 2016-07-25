class RuralLga < ActiveRecord::Base
  belongs_to :state 
  has_many :rural_districts 
end 
