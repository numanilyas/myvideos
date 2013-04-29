class HomeController < ApplicationController
  def index
    if signed_in?
      @user = current_user
      @videos = @user.videos        
      @album_videos = @user.video_categories.find_by_id(params[:cat_id]).videos unless params[:cat_id].nil?
    else
      @user = User.new
      @videos = Video.order('created_at desc').limit(10)  
    end    
  end
end
