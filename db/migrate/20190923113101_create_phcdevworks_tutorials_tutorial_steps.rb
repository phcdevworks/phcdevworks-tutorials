class CreatePhcdevworksTutorialsTutorialSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_tutorials_tutorial_steps do |t|
      t.integer :tutorial_step_number
      t.text :tutorial_step_body

      t.timestamps
    end
  end
end
