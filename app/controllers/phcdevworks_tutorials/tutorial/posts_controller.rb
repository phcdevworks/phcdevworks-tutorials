require_dependency "phcdevworks_tutorials/application_controller"

module PhcdevworksTutorials
  class Tutorial::PostsController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_tutorial_post, only: [:show, :edit, :update, :destroy]

    # GET /tutorial/posts
    def index
      @tutorial_posts = Tutorial::Post.all
    end

    # GET /tutorial/posts/1
    def show
    end

    # GET /tutorial/posts/new
    def new
      @tutorial_post = Tutorial::Post.new
    end

    # GET /tutorial/posts/1/edit
    def edit
    end

    # POST /tutorial/posts
    def create
      @tutorial_post = Tutorial::Post.new(tutorial_post_params)
      @tutorial_post.user_id = current_user.id
      @tutorial_post.org_id = current_user.org_id
      respond_to do |format|
        if @tutorial_post.save
          format.html { redirect_to tutorial_posts_path, :flash => { :success => 'Tutorial has been Added.' }}
          format.json { render :show, status: :created, location: @tutorial_post }
        else
          format.html { render :new }
          format.json { render json: @tutorial_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tutorial/posts/1
    def update
      respond_to do |format|
        if @tutorial_post.update(tutorial_post_params)
          format.html { redirect_to tutorial_posts_path, :flash => { :notice => 'Tutorial has been Updated.' }}
          format.json { render :show, status: :ok, location: @tutorial_post }
        else
          format.html { render :edit }
          format.json { render json: @tutorial_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tutorial/posts/1
    def destroy
      @tutorial_post.destroy
        respond_to do |format|
          format.html { redirect_to tutorial_posts_path, :flash => { :error => 'Tutorial has been Removed.' }}
          format.json { head :no_content }
      end
    end

    private

    # Common Callbacks
    def set_tutorial_post
      @tutorial_post = Tutorial::Post.find(params[:id])
    end

    # Whitelist
    def tutorial_post_params
      params.require(:tutorial_post).permit(:tutorial_post_title, :tutorial_post_description, :tutorial_post_status, :tutorial_post_image, :slug, :user_id, :org_id, category_ids: [])
    end

  end
end
