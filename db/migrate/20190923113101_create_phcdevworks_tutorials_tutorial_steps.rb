class CreatePhcdevworksTutorialsTutorialSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_steps do |t|

      t.integer :tutorial_step_number
      t.string :tutorial_step_title
      t.text :tutorial_step_description

      t.string :tutorial_step_image
      t.string :tutorial_step_images

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.references :post

      t.timestamps

    end
  end
end
