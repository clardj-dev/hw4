class EntriesController < ApplicationController
  before_action :require_login
  before_action :set_place

  def new
    @entry = @place.entries.new
  end

  def create
    # Build using strong params—Rails will automatically attach :uploaded_image
    @entry = @place.entries.new(entry_params)
    @entry.user = current_user

    if @entry.save
      flash[:notice] = "Entry added!"
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  private

  def set_place
    @place = current_user.places.find_by(id: params[:place_id])
    if @place.nil?
      flash[:notice] = "Not authorized to add an entry"
      redirect_to "/places"
    end
  end

  # strong params: permit exactly the columns plus the attachment
  def entry_params
    params.require(:entry).permit(
      :title,
      :description,
      :occurred_on,
      :uploaded_image   # must match has_one_attached :uploaded_image in the model
    )
  end
end
