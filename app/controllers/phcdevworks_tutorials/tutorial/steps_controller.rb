require_dependency "phcdevworks_tutorials/application_controller"

module PhcdevworksTutorials
  class Tutorial::StepsController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_tutorial_step, only: [:show, :edit, :update, :destroy]

    # GET /tutorial/steps
    def index
      @steps = tutorial_post.steps.all
    end

    # GET /tutorial/steps/1
    def show
      @steps = tutorial_post.steps.find(params[:id])
    end

    # GET /tutorial/steps/new
    def new
      @steps = tutorial_post.steps.build
    end

    # GET /tutorial/steps/1/edit
    def edit
      @tutorial_post = Tutorial::Post.friendly.find(params[:post_id])
    end

    # POST /tutorial/steps
    def create
      @steps = tutorial_post.steps.create(steps_params)
      @steps.user_id = current_user.id
      @steps.org_id = current_user.org_id
      respond_to do |format|
        if @steps.save
          format.html { redirect_to stepss_path, :flash => { :success => 'Tutorial has been Added.' }}
          format.json { render :show, status: :created, location: @steps }
        else
          format.html { render :new }
          format.json { render json: @steps.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tutorial/steps/1
    def update
      @tutorial_post = Tutorial::Post.friendly.find(params[:post_id])
      respond_to do |format|
        if @steps.update(steps_params)
          format.html { redirect_to stepss_path, :flash => { :notice => 'Tutorial has been Updated.' }}
          format.json { render :show, status: :ok, location: @steps }
        else
          format.html { render :edit }
          format.json { render json: @steps.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tutorial/steps/1
    def destroy
      @steps = tutorial_post.steps.find(params[:id])
      @steps.destroy
      @steps.destroy
        respond_to do |format|
        format.html { redirect_to stepss_path, :flash => { :error => 'Tutorial has been Removed.' }}
        format.json { head :no_content }
      end
    end

    private

    # Common Callbacks

    def set_steps
      @steps = Tutorial::Step.find(params[:id])
    end
    
    def tutorial_post
      @tutorial_post = Tutorial::Post.friendly.find(params[:post_id])
    end

    # Whitelist
    def tutorial_step_params
      params.require(:steps).permit(:steps_number, :steps_body, :slug, :user_id, :org_id)
    end

  end
end
