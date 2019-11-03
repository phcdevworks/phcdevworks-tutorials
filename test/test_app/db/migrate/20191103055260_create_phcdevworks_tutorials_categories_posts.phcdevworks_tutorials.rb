# This migration comes from phcdevworks_tutorials (originally 20191024232406)
class CreatePhcdevworksTutorialsCategoriesPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_categories_posts do |t|
      t.integer :category_id
      t.integer :post_id
    end
  end
end
