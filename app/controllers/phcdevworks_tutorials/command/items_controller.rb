require_dependency "phcdevworks_tutorials/application_controller"

module PhcdevworksTutorials
  class Command::ItemsController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_command_item, only: [:show, :edit, :update, :destroy]

    # GET /command/items
    def index
      @command_items = Command::Item.all
    end

    # GET /command/items/1
    def show
    end

    # GET /command/items/new
    def new
      @command_item = Command::Item.new
    end

    # GET /command/items/1/edit
    def edit
    end

    # POST /command/items
    def create
      @command_item = Command::Item.new(command_item_params)
      if @command_item.save
        redirect_to @command_item, notice: 'Item was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /command/items/1
    def update
      if @command_item.update(command_item_params)
        redirect_to @command_item, notice: 'Item was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /command/items/1
    def destroy
      @command_item.destroy
      redirect_to command_items_url, notice: 'Item was successfully destroyed.'
    end

    private

    # Common Callbacks
    def set_command_item
      @command_item = Command::Item.find(params[:id])
    end

    # Whitelist
    def command_item_params
      params.require(:command_item).permit(:item_name, :item_description, :item_copy_command, :item_image, :slug, :user_id, :org_id)
    end

  end
end
