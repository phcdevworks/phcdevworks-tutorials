# This migration comes from phcdevworks_tutorials (originally 20200702121306)
class RemoveImagesColsFromPhcdevworksTutorials < ActiveRecord::Migration[6.0]
  def change

    remove_column :phcdevworks_tutorials_tutorial_posts, :post_image, :string
    remove_column :phcdevworks_tutorials_tutorial_steps, :step_image, :string
    remove_column :phcdevworks_tutorials_command_posts, :post_image, :string
    remove_column :phcdevworks_tutorials_command_items, :item_image, :string

  end
end
