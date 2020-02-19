class AddCopyInstructionsToSteps < ActiveRecord::Migration[6.0]
  def change
  
    add_column :phcdevworks_tutorials_tutorial_steps, :step_copy_instruction, :text
  
  end
end
