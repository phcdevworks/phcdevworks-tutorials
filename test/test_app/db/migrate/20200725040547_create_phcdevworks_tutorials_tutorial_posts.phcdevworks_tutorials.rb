# This migration comes from phcdevworks_tutorials (originally 20191017235259)
class CreatePhcdevworksTutorialsTutorialPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_posts do |t|

      t.string :tutorial_post_title
      t.text :tutorial_post_text
      t.string :tutorial_post_status

      t.string :optimization_id

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
