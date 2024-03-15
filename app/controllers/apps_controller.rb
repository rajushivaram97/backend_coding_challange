class AppsController < ApplicationController

  # GET /apps
  def index
    @apps = filter_apps
  end

  private

    # Only allow a list of trusted parameters through.
    def app_params
      params.permit(:approved, :published, :kind, :price_tier)
    end

    # Filter apps based on query parameters
    def filter_apps
      apps = App.all
      apps = apps.where(approved: params[:approved]) if params[:approved].present?
      apps = apps.where(published: params[:published]) if params[:published].present?
      apps = apps.where(kind: params[:kind]) if params[:kind].present?
      apps = apps.where(price_tier: params[:price_tier]) if params[:price_tier].present?
      apps
    end

    # SQL for above ORM
    # For example, if a user wants to find approved, published games within price tier 1, the SQL might look like this:
    # SELECT * FROM apps WHERE approved = true AND published = true AND kind = 'game' AND price_tier = 1;

end
