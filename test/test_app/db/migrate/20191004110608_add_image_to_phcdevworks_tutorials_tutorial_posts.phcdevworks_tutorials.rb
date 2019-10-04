# This migration comes from phcdevworks_tutorials (originally 20191002093451)
class AddImageToPhcdevworksTutorialsTutorialPosts < ActiveRecord::Migration[6.0]
  def change

    add_column :phcdevworks_tutorials_tutorial_steps, :tutorial_step_image, :string
    add_column :phcdevworks_tutorials_tutorial_posts, :tutorial_post_image, :string

  end
end
