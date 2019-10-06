class AddImageToPhcdevworksTutorialsTutorialSteps < ActiveRecord::Migration[6.0]
  def change

    add_column :phcdevworks_tutorials_tutorial_steps, :tutorial_step_image, :string

  end
end
