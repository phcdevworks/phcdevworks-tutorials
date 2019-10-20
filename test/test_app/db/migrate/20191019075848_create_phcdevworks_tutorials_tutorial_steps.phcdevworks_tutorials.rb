# This migration comes from phcdevworks_tutorials (originally 20191017235421)
class CreatePhcdevworksTutorialsTutorialSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_steps do |t|

      t.string :tutorial_step_number
      t.string :tutorial_step_title
      t.string :tutorial_step_description
      t.string :tutorial_step_image

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.references :post

      t.timestamps

    end
  end
end
