class PlacesController < ApplicationController
before_action :require_login
before_action :set_place, only: ["show"]

  def index
    @places = current_user.places.order({ "created_at" => :desc })
  end

  def show
    @entries = @place.entries.order({ "occurred_on" => :desc })
  end

  def new
    @place = current_user.places.new
  end

  def create
    @place = current_user.places.new
    @place["name"]        = params["place"]["name"]
    @place["location"]    = params["place"]["location"]
    @place["description"] = params["place"]["description"]

    if @place.save
      flash["notice"] = "Place created!"
      redirect_to "/places/#{@place["id"]}"
    else
      render :new
  end
end

  private

  # Load the current_user's place (so nobody can see another user's)
  def set_place
    @place = current_user.places.find_by({ "id" => params["id"] })
    if @place == nil
      flash["notice"] = "Not authorized to view that place"
      redirect_to "/places"
    end
  end
