# This migration comes from phcdevworks_tutorials (originally 20200321122525)
class CreatePhcdevworksTutorialsCommandItemsVersions < ActiveRecord::Migration[6.0]
  TEXT_BYTES = 1_073_741_823
  def change
    create_table :phcdevworks_tutorials_command_items_versions do |t|

      t.string   :item_type, {:null=>false}
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object, limit: TEXT_BYTES
      t.datetime :created_at

    end

    add_index :phcdevworks_tutorials_command_items_versions, %i(item_type item_id), :name => 'command_item_versions'

  end
end
