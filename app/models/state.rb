class State < ActiveRecord::Base 
  belongs_to :zone 
  has_many :towns 
end 
