class UsersController < ApplicationController
  before_filter :signed_in_user, :only => [:show]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @videos = @user.videos        
    @album_videos = @user.video_categories.find_by_id(params[:cat_id]).videos unless params[:cat_id].nil? 
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the My Videos!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  private
  def signed_in_user    
    store_location
    if !signed_in? || User.find(params[:id]) != current_user
        redirect_to root_url, notice: "Invalid URL"
    end        
  end
  
end
