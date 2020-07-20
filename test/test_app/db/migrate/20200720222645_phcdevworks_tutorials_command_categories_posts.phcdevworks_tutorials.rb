# This migration comes from phcdevworks_tutorials (originally 20200328012248)
class PhcdevworksTutorialsCommandCategoriesPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_command_categories_posts do |t|

      t.integer :category_id
      t.integer :post_id

    end
  end
end
