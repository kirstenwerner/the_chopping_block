class Recipe < ActiveRecord::Base 
    belongs_to :user 
    has_many :recipe_categories
    has_many :categories, through: :recipe_categories

    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :details, presence: true, length: { minimum: 10, maximum: 1000 }
    validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
    validates :user_id, presence: true
end 