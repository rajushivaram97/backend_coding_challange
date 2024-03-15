class User < ApplicationRecord
    has_many :purchases
    has_many :apps, through: :purchases
  
    # Ensure the email is unique
    validates :email, presence: true, uniqueness: true
      
    # Method to find users with 2 or more app purchases
    def self.with_two_or_more_apps
        User.joins(:purchases)
            .group('users.id')
            .having('COUNT(purchases.app_id) >= 2')
            .select('users.*, COUNT(purchases.app_id) as apps_count')
    end

    # SELECT users.*, COUNT(purchases.app_id) as apps_count
    # FROM users
    # JOIN purchases ON purchases.user_id = users.id
    # GROUP BY users.id
    # HAVING COUNT(purchases.app_id) >= 2;

      
  end  