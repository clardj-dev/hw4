class EntriesController < ApplicationController
before_action :require_login
before_action :set_place

  def new
    @entry = @place.entries.new
  end

  def create
    @entry = @place.entries.new
    @entry["title"]       = params["entry"]["title"]
    @entry["long_desc"]   = params["entry"]["long_desc"]
    @entry["occurred_on"] = params["entry"]["occurred_on"]
    @entry["image"]       = params["entry"]["image"]

    if @entry.save
      flash["notice"] = "Entry added!"
      redirect_to "/places/#{@place["id"]}"
    else
      render :new
    end
  end

  private

  def set_place
    @place = current_user.places.find_by({ "id" => params["place_id"] })
    if @place == nil
      flash["notice"] = "Not authorized to add an entry"
      redirect_to "/places"
    end
  end  

end
