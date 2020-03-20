module PhcdevworksTutorials
  class Command::Item < ApplicationRecord

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksTutorials::CommandItemVersions'

    # Image Upload
    has_one_attached :item_image

    # Relationships
    belongs_to :post, class_name: "Command::Post"
    has_many :categories, class_name: "Tutorial::Category", :through => :post
    belongs_to :user, class_name: "PhcdevworksAccounts::User"

  end
end
