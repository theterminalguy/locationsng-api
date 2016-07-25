class RuralPostCode < ActiveRecord::Base 
  serialize :towns 
  belongs_to :rural_district
end 
