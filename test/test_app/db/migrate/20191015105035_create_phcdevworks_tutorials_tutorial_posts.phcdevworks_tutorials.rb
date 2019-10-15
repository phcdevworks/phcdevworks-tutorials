# This migration comes from phcdevworks_tutorials (originally 20190911225813)
class CreatePhcdevworksTutorialsTutorialPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_posts do |t|

      t.string :tutorial_post_title
      t.text :tutorial_post_description
      t.string :tutorial_post_status
      
      t.string :tutorial_post_image
      t.string :tutorial_post_images

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
