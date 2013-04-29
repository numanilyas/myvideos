class VideoCategoriesController < ApplicationController
  before_filter :signed_in_user
  
  
  
  # GET /video_categories
  # GET /video_categories.json
  def index
    @video_categories = VideoCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video_categories }
    end
  end

  # GET /video_categories/1
  # GET /video_categories/1.json
  def show
    @video_category = VideoCategory.find(params[:id])
    @videos = @video_category.videos 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video_category }
    end
  end

  # GET /video_categories/new
  # GET /video_categories/new.json
  def new
    @video_category = VideoCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video_category }
    end
  end

  # GET /video_categories/1/edit
  def edit
    @video_category = VideoCategory.find(params[:id])
  end

  # POST /video_categories
  # POST /video_categories.json
  def create
    @video_category = current_user.video_categories.build(params[:video_category])
    logger.info @video_category.category
    respond_to do |format|
      if @video_category.save
        format.html { redirect_to current_user, notice: 'Album was successfully created.' }
        format.json { render json: @video_category, status: :created, location: @video_category }
      else
        format.html { render action: "new" }
        format.json { render json: @video_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /video_categories/1
  # PUT /video_categories/1.json
  def update
    @video_category = VideoCategory.find(params[:id])

    respond_to do |format|
      if @video_category.update_attributes(params[:video_category])
        format.html { redirect_to @video_category, notice: 'Video category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_categories/1
  # DELETE /video_categories/1.json
  def destroy
    @video_category = VideoCategory.find(params[:id])
    @video_category.destroy

    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Album was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  private
  def signed_in_user
    store_location
    redirect_to root_url, notice: "Please sign in." unless signed_in?
  end
  
end
