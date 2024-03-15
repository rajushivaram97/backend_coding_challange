class User < ApplicationRecord
    has_many :purchases
    has_many :apps, through: :purchases
  
    # Ensure the email is unique
    validates :email, presence: true, uniqueness: true
  end