class CreatePhcdevworksTutorialsCommandItems < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_command_items do |t|

      t.string :item_name
      t.text :item_description
      t.string :item_copy_command
      t.string :item_image

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.references :post

      t.timestamps

    end
  end
end
