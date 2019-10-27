class CreatePhcdevworksTutorialsTutorialPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_posts do |t|

      t.string :post_title
      t.string :post_description
      t.string :post_status
      t.string :post_image

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
