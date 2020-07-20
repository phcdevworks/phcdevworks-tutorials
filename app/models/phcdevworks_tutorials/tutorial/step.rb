module PhcdevworksTutorials
  class Tutorial::Step < ApplicationRecord

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksTutorials::TutorialStepVersions'

    # Image Upload
    has_one_attached :tutorial_step_image

    # Relationships
    belongs_to :user, class_name: "PhcdevworksAccounts::User"
    belongs_to :post, class_name: "Tutorial::Post"
    belongs_to :optimization, class_name: "PhcdevworksCoreModules::Marketing::Optimization", optional: true
    has_many :categories, class_name: "Tutorial::Category", :through => :post

  end
end
