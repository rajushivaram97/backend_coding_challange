class AppsController < ApplicationController

  # GET /apps
  def index
    @apps = filter_apps
  end

  def by_names
    if params[:names].present?
      @apps = App.includes(:users).where(name: params[:names])
      render json: @apps, include: :users
    else
      render json: { error: 'No app names provided' }, status: :bad_request
    end

    # RAQ SQL
    # SELECT "apps".* FROM "apps" WHERE "apps"."name" IN ('App Name 1', 'App Name 2');

  private

    # Only allow a list of trusted parameters through.
    def app_params
      params.permit(:approved, :published, :kind, :price_tier)
    end

end
