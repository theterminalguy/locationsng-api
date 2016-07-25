class Area < ActiveRecord::Base 
  belongs_to :area 

  has_many :streets 
  has_one :post_code 
end 
