require_dependency "phcdevworks_tutorials/application_controller"

module PhcdevworksTutorials
  class Blog::CommandsController < ApplicationController

    # Layout
    layout 'phcdevworks_tutorials/frontend'

    # INDEX
    def index
      @phcdevworks_commands_index = Command::Post.where(command_post_status: "published").order("created_at DESC")
      @phcdevworks_commands_photo_randomizer = Command::Post.order('RANDOM()').limit(1)
    end

    # SHOW
    def show
      @phcdevworks_commands_single = Command::Post.friendly.find(params[:id])
    end

  end
end
