class AddInfoToPhcdevworksTutorialsTutorialPosts < ActiveRecord::Migration[6.0]
  def change

    add_column :phcdevworks_tutorials_tutorial_posts, :tutorial_post_images, :string
    add_column :phcdevworks_tutorials_tutorial_posts, :tutorial_post_description, :text
    add_column :phcdevworks_tutorials_tutorial_posts, :tutorial_post_status, :string

  end
end
