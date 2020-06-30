# This migration comes from phcdevworks_tutorials (originally 20191110232654)
class AddCopyInstructionsToSteps < ActiveRecord::Migration[6.0]
    def change
        add_column :phcdevworks_tutorials_tutorial_steps, :step_copy_instruction, :text
    end
end
