class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["user"]["username"]
    @user["email"]    = params["user"]["email"]

    # assign password and confirmation via the accessors, not as DB columns
    @user.password              = params["user"]["password"]
    @user.password_confirmation = params["user"]["password_confirmation"]

    if @user.save
      session["user_id"] = @user["id"]
      flash["notice"]    = "Welcome, #{@user["username"]}!"
      redirect_to "/places"
    else
      render :new
    end
  end

end
