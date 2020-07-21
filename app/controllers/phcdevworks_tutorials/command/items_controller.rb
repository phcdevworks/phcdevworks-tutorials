require_dependency "phcdevworks_tutorials/application_controller"

module PhcdevworksTutorials
  class Command::ItemsController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_command_item, only: [:show, :edit, :update, :destroy]

    # GET /post/items
    # GET /post/items.json
    def index
      @command_items = command_post.items.order('command_item_title ASC')
    end

    # GET /post/items/1
    # GET /post/items/1.json
    def show
      @command_item = command_post.items.find(params[:id])
      @member_address_versions = PhcdevworksTutorials::CommandItemVersions.where(item_id: @command_item, item_type: 'PhcdevworksTutorials::Command::Item')
    end

    # GET /post/items/new
    def new
      @command_item = command_post.items.build
    end

    # GET /post/items/1/edit
    def edit
      @command_post = Command::Post.friendly.find(params[:post_id])
    end

    # POST /post/items
    # POST /post/items.json
    def create
      @command_item = command_post.items.create(command_item_params)
      @command_item.user_id = current_user.id
      @command_item.org_id = current_user.org_id
      respond_to do |format|
        if @command_item.save
          format.html { redirect_to command_post_items_url, :flash => { :success => 'Command Item has been Added' }}
          format.json { render :show, status: :created, location: @command_item }
        else
          format.html { render :new }
          format.json { render json: @command_item.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /post/items/1
    # PATCH/PUT /post/items/1.json
    def update
      @command_post = Command::Post.friendly.find(params[:post_id])
      respond_to do |format|
        if @command_item.update(command_item_params)
          format.html { redirect_to command_post_items_url, :flash => { :notice => 'Command Item has been Updated.' }}
          format.json { render :show, status: :ok, location: @command_item }
        else
          format.html { render :edit }
          format.json { render json: @command_item.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /post/items/1
    # DELETE /post/items/1.json
    def destroy
      @command_item = command_post.items.find(params[:id])
      @command_item.destroy
      respond_to do |format|
        format.html { redirect_to command_post_items_url, :flash => { :error => 'Command Item has been Removed' }}
        format.json { head :no_content }
      end
    end

    private

    # Common Callbacks
    def set_command_item
      @command_item = Command::Item.find(params[:id])
    end

    def command_post
      @command_post = Command::Post.friendly.find(params[:post_id])
    end

    # Whitelist
    def command_item_params
      params.require(:command_item).permit(:command_item_title, :command_item_text, :command_item_copy_command, :command_item_image, :slug, :optimization_id, :user_id, :org_id)
    end

  end
end
