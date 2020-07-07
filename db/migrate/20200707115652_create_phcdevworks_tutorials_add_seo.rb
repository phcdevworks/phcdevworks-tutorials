class CreatePhcdevworksTutorialsAddSeo < ActiveRecord::Migration[6.0]
  def change

    add_column :phcdevworks_tutorials_tutorial_posts, :optimization_id, :string
    add_column :phcdevworks_tutorials_tutorial_steps, :optimization_id, :string
    add_column :phcdevworks_tutorials_command_posts, :optimization_id, :string
    add_column :phcdevworks_tutorials_command_items, :optimization_id, :string

  end
end
