# This migration comes from phcdevworks_tutorials (originally 20200320110115)
class CreatePhcdevworksTutorialsCommandPosts < ActiveRecord::Migration[6.0]
    def change
        create_table :phcdevworks_tutorials_command_posts do |t|

            t.string :post_title
            t.text :post_description
            t.string :post_status
            t.string :post_image

            t.string :slug
            t.string :user_id
            t.string :org_id

            t.timestamps

        end
    end
end
