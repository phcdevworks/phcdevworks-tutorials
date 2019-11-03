module PhcdevworksTutorials
  class Tutorial::Step < ApplicationRecord

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksTutorials::TutorialStepVersions'

    # Image Upload
    has_one_attached :step_image

    # Relationships
    belongs_to :post, class_name: "Tutorial::Post"
    has_many :categories, class_name: "Tutorial::Category", :through => :post
    belongs_to :user, class_name: "PhcdevworksAccounts::User"

  end
end
