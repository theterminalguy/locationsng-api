class PostCode < ActiveRecord::Base 
  serialize :streets
  
  belongs_to :area 
end 
