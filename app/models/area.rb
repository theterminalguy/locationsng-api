class Area < ActiveRecord::Base 
  belongs_to :area 

  has_many :streets 
end 
