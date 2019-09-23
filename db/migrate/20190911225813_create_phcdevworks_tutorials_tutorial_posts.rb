class CreatePhcdevworksTutorialsTutorialPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_posts do |t|

      t.string :tutorial_post_title

      t.references :category

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
