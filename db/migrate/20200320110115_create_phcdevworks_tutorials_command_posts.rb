class CreatePhcdevworksTutorialsCommandPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_command_posts do |t|

      t.string :command_post_title
      t.text :command_post_text
      t.string :command_post_status

      t.string :optimization_id

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
