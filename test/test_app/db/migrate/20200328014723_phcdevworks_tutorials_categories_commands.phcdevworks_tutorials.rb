# This migration comes from phcdevworks_tutorials (originally 20200328012248)
class PhcdevworksTutorialsCategoriesCommands < ActiveRecord::Migration[6.0]
    def change
        create_table :phcdevworks_tutorials_categories_commands do |t|

            t.integer :category_id
            t.integer :post_id

        end
    end
end
