class AddInfoToPhcdevworksTutorialsTutorialSteps < ActiveRecord::Migration[6.0]
  def change

    add_column :phcdevworks_tutorials_tutorial_steps, :tutorial_step_images, :string

  end
end
