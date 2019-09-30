# This migration comes from phcdevworks_tutorials (originally 20190929044505)
class AddInfoToPhcdevworksTutorialsTutorialSteps < ActiveRecord::Migration[6.0]
  def change

    add_column :phcdevworks_tutorials_tutorial_steps, :tutorial_step_images, :string

  end
end
