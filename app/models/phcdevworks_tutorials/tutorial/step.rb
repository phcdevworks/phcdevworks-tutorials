module PhcdevworksTutorials
  class Tutorial::Step < ApplicationRecord

    # Image Upload
    has_one_attached :tutorial_step_image

    # Relationships
    belongs_to :post, class_name: "Tutorial::Post"
    has_many :categories, class_name: "Tutorial::Category", :through => :post
    belongs_to :user, class_name: "PhcdevworksAccounts::User"

  end
end
