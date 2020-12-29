# This migration comes from phcdevworks_tutorials (originally 20200320110553)
class CreatePhcdevworksTutorialsCommandItems < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_command_items do |t|

      t.string :command_item_title
      t.text :command_item_text
      t.string :command_item_copy_command

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.references :post

      t.timestamps

    end
  end
end
