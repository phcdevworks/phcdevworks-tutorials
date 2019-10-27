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
      @tutorial_steps = tutorial_post.steps.order("tutorial_step_number")
    end

    # GET /tutorial/steps/1
    def show
      @tutorial_step = tutorial_post.steps.find(params[:id])
    end

    # GET /tutorial/steps/new
    def new
      @tutorial_step = tutorial_post.steps.build
    end

    # GET /tutorial/steps/1/edit
    def edit
      @tutorial_post = Tutorial::Post.friendly.find(params[:post_id])
    end

    # POST /tutorial/steps
    def create
      @tutorial_step = tutorial_post.steps.create(tutorial_step_params)
      @tutorial_step.user_id = current_user.id
      @tutorial_step.org_id = current_user.org_id
      respond_to do |format|
        if @tutorial_step.save
          format.html { redirect_to tutorial_post_steps_url, :flash => { :success => 'Member Listing has been Added' }}
          format.json { render :show, status: :created, location: @tutorial_step }
        else
          format.html { render :new }
          format.json { render json: @tutorial_step.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tutorial/steps/1
    def update
      @tutorial_post = Tutorial::Post.friendly.find(params[:post_id])
      respond_to do |format|
        if @tutorial_step.update(tutorial_step_params)
          format.html { redirect_to tutorial_post_steps_url, :flash => { :notice => 'Member Listing has been Updated.' }}
          format.json { render :show, status: :ok, location: @tutorial_step }
        else
          format.html { render :edit }
          format.json { render json: @tutorial_step.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tutorial/steps/1
    def destroy
      @tutorial_step = tutorial_post.steps.find(params[:id])
      @tutorial_step.destroy
      respond_to do |format|
        format.html { redirect_to tutorial_post_steps_url, :flash => { :error => 'Member Listing has been Removed' }}
        format.json { head :no_content }
      end
    end

    private

    # Common Callbacks
    def set_tutorial_step
      @tutorial_step = Tutorial::Step.find(params[:id])
    end

    def tutorial_post
      @tutorial_post = Tutorial::Post.friendly.find(params[:post_id])
    end

    # Whitelist
    def tutorial_step_params
      params.require(:tutorial_step).permit(:step_number, :step_title, :step_description, :step_image, :post_id, :slug, :user_id, :org_id)
    end

  end
end
