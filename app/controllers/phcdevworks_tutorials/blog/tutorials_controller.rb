require_dependency "phcdevworks_tutorials/application_controller"

module PhcdevworksTutorials
  class Blog::TutorialsController < ApplicationController

    # Layout
    layout 'phcdevworks_tutorials/frontend'

    # INDEX
    def index
      @phcdevworks_tutorials_index = Tutorial::Post.where(post_status: "published").order("created_at DESC")
      @phcdevworks_tutorials_photo_randomizer = Tutorial::Post.order('RANDOM()').limit(1)
    end

    # SHOW
    def show
      @phcdevworks_tutorials_single = Tutorial::Post.friendly.find(params[:id])
    end

  end
end
