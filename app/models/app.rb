class App < ApplicationRecord
    enum kind: { game: 0, art: 1, programming: 2, music: 3, literature: 4 }
  
    has_many :purchases
    has_many :users, through: :purchases
  
    # Add validations for app properties
    validates :name, presence: true, uniqueness: true
    validates :kind, presence: true
    validates :price_tier, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }
  
    # You could add custom scopes or methods to filter apps by various attributes
  end  