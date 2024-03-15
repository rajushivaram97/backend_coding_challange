class AppsController < ApplicationController

  # GET /apps
  def index
    @apps = filter_apps
  end

  def unpurchased
    @unpurchased_apps = App.unpurchased
  end

  private

    # Only allow a list of trusted parameters through.
    def app_params
      params.permit(:approved, :published, :kind, :price_tier)
    end

end
