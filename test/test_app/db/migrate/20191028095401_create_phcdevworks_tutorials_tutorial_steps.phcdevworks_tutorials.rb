# This migration comes from phcdevworks_tutorials (originally 20191017235421)
class CreatePhcdevworksTutorialsTutorialSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_steps do |t|

      t.string :step_number
      t.string :step_title
      t.string :step_description
      t.string :step_image

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.references :post

      t.timestamps

    end
  end
end
