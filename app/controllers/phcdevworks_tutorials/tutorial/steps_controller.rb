require_dependency "phcdevworks_tutorials/application_controller"

module PhcdevworksTutorials
  class Tutorial::StepsController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_tutorial_step, only: [:show, :edit, :update, :destroy]

    # GET /tutorial/steps
    # GET /tutorial/steps.json
    def index
      @tutorial_steps = tutorial_post.steps.all
    end

    # GET /tutorial/steps/1
    # GET /tutorial/steps/1.json
    def show
      @tutorial_step = tutorial_post.steps.find(params[:id])
    end

    # GET /tutorial/steps/new
    def new
      @tutorial_step = tutorial_post.steps.build
    end

    # GET /tutorial/steps/1/edit
    def edit
      @tutorial_step = Tutorial::Post.friendly.find(params[:post_id])
    end

    # POST /tutorial/steps
    # POST /tutorial/steps.json
    def create
      @tutorial_step = tutorial_post.steps.create(tutorial_step_params)
      @tutorial_step.user_id = current_user.id
      @tutorial_step.org_id = current_user.org_id
      respond_to do |format|
        if @tutorial_step.save
          format.html { redirect_to tutorial_post_steps_path, :flash => { :success => 'Tutorial Step has been Added' }}
          format.json { render :show, status: :created, location: @tutorial_step }
        else
          format.html { render :new }
          format.json { render json: @tutorial_step.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tutorial/steps/1
    # PATCH/PUT /tutorial/steps/1.json
    def update
      @tutorial_post = Tutorial::Post.friendly.find(params[:post_id])
      respond_to do |format|
        if @tutorial_step.update(tutorial_step_params)
          format.html { redirect_to tutorial_post_steps_path, :flash => { :notice => 'Tutorial Step has been Updated.' }}
          format.json { render :show, status: :ok, location: @tutorial_step }
        else
          format.html { render :edit }
          format.json { render json: @tutorial_step.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tutorial/steps/1
    # DELETE /tutorial/steps/1.json
    def destroy
      @tutorial_step = tutorial_post.steps.find(params[:id])
      @tutorial_step.destroy
      respond_to do |format|
        format.html { redirect_to tutorial_post_steps_path, :flash => { :error => 'Tutorial Step has been Removed' }}
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
      params.require(:tutorial_step).permit(:steps_number, :steps_body, :tutorial_step_image, :post_id, :slug, :user_id, :org_id)
    end

  end
end
