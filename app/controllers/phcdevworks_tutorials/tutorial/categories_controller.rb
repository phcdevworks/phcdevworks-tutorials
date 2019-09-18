require_dependency "phcdevworks_tutorials/application_controller"

module PhcdevworksTutorials
  class Tutorial::CategoriesController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_tutorial_category, only: [:show, :edit, :update, :destroy]

    # GET /tutorial/categories
    def index
      @tutorial_categories = Tutorial::Category.all
    end

    # GET /tutorial/categories/1
    def show
      @tutorial_category = Tutorial::Category.friendly.find(params[:id])
    end

    # GET /tutorial/categories/new
    def new
      @tutorial_category = Tutorial::Category.new
    end

    # GET /tutorial/categories/1/edit
    def edit
    end

    # POST /tutorial/categories
    def create
      @tutorial_category = Tutorial::Category.new(tutorial_category_params)
      @tutorial_category.user_id = current_user.id
      @tutorial_category.org_id = current_user.org_id
      respond_to do |format|
        if @tutorial_category.save
          format.html { redirect_to tutorial_categories_path, :flash => { :success => 'Tutorial has been Added.' }}
          format.json { render :show, status: :created, location: @tutorial_category }
        else
          format.html { render :new }
          format.json { render json: @tutorial_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tutorial/categories/1
    def update
      respond_to do |format|
        if @tutorial_category.update(tutorial_category_params)
          format.html { redirect_to tutorial_categories_path, :flash => { :notice => 'Tutorial has been Updated.' }}
          format.json { render :show, status: :ok, location: @tutorial_category }
        else
          format.html { render :edit }
          format.json { render json: @tutorial_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tutorial/categories/1
    def destroy
      @tutorial_category.destroy
      respond_to do |format|
        format.html { redirect_to tutorial_categories_path, :flash => { :error => 'Categories and Connections have all been Removed.' }}
        format.json { head :no_content }
      end
    end

    private

    # Common Callbacks
    def set_tutorial_category
      @tutorial_category = Tutorial::Category.friendly.find(params[:id])
    end

    # Whitelist
    def tutorial_category_params
      params.require(:tutorial_category).permit(:tutorial_category_name)
    end

  end
end
