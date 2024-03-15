class UsersController < ApplicationController
    # GET /users/high_volume_purchasers
    def high_volume_purchasers
      @users = User.with_two_or_more_apps
    end
  end
  