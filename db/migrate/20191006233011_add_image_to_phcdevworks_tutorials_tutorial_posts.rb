class AddImageToPhcdevworksTutorialsTutorialPosts < ActiveRecord::Migration[6.0]
  def change

    add_column :phcdevworks_tutorials_tutorial_posts, :tutorial_post_image, :string

  end
end
