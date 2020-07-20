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
      respond_to do |format|
        if @command_post.save
          format.html { redirect_to command_posts_path, :flash => { :success => 'Command Post has been Added.' }}
          format.json { render :show, status: :created, location: @command_post }
        else
          format.html { render :new }
          format.json { render json: @command_post.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # PATCH/PUT /command/posts/1
    def update
      respond_to do |format|
        if @command_post.update(command_post_params)
          format.html { redirect_to command_posts_path, :flash => { :notice => 'Command Post has been Updated.' }}
          format.json { render :show, status: :ok, location: @command_post }
        else
          format.html { render :edit }
          format.json { render json: @command_post.errors, status: :unprocessable_entity }
        end
      end
    end
    
    # DELETE /command/posts/1
    def destroy
      @command_post.destroy
        respond_to do |format|
          format.html { redirect_to command_posts_path, :flash => { :error => 'Command Post has been Removed.' }}
          format.json { head :no_content }
      end
    end
    
    private

    # Common Callbacks
    def set_command_post
      @command_post = Command::Post.find(params[:id])
    end

    # Whitelist
    def command_post_params
      params.require(:command_post).permit(:command_post_title, :command_post_text, :command_post_status, :command_post_image, :slug, :optimization_id, :user_id, :org_id, category_ids: [])
    end

  end
end
