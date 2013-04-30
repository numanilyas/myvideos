class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to root_url
    end
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      #@video_categories = user.video_categories
      #@videos = user.videos
      redirect_back_or root_url
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      redirect_to root_url
      #render :template => "home/index"
    end
  end

  def destroy
    sign_out
    delete_stored_location
    redirect_to root_url
  end
end
