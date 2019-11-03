# This migration comes from phcdevworks_tutorials (originally 20191018124910)
class CreatePhcdevworksTutorialsTutorialCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_categories do |t|

      t.string :category_name

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
