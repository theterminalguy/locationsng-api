class Area < ActiveRecord::Base 
  belongs_to :town 

  has_many :streets 
  has_one :post_code 
end 
