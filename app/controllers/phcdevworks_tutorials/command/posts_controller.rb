require_dependency "phcdevworks_tutorials/application_controller"

module PhcdevworksTutorials
  class Command::PostsController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_command_post, only: [:show, :edit, :update, :destroy]
    
    # GET /command/posts
    def index
      @command_posts = Command::Post.all
    end
    
    # GET /command/posts/1
    def show
    end
    
    # GET /command/posts/new
    def new
      @command_post = Command::Post.new
    end
    
    # GET /command/posts/1/edit
    def edit
    end
    
    # POST /command/posts
    def create
      @command_post = Command::Post.new(command_post_params)
      @command_post.user_id = current_user.id
      @command_post.org_id = current_user.org_id
      if @command_post.save
        redirect_to @command_post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
    
    # PATCH/PUT /command/posts/1
    def update
      if @command_post.update(command_post_params)
        redirect_to @command_post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
    
    # DELETE /command/posts/1
    def destroy
      @command_post.destroy
      redirect_to command_posts_url, notice: 'Post was successfully destroyed.'
    end
    
    private

    # Common Callbacks
    def set_command_post
      @command_post = Command::Post.find(params[:id])
    end

    # Whitelist
    def command_post_params
      params.require(:command_post).permit(:post_title, :post_description, :post_status, :post_image, :slug, :user_id, :org_id)
    end

  end
end
