# This migration comes from phcdevworks_tutorials (originally 20190923113101)
class CreatePhcdevworksTutorialsTutorialSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_steps do |t|

      t.integer :tutorial_step_number
      t.text :tutorial_step_body

      t.references :post

      t.timestamps

    end
  end
end
