class Recipe < ActiveRecord::Base 
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :details, presence: true, length: { minimum: 10, maximum: 1000 }
    validates :description, presence: true { minimum: 10, maximum: 5000 }


end 