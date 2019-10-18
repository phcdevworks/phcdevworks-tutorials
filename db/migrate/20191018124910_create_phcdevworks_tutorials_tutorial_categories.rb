class CreatePhcdevworksTutorialsTutorialCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_categories do |t|
      t.string :tutorial_category_name

      t.timestamps
    end
  end
end
