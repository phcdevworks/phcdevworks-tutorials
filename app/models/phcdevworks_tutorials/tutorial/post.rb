module PhcdevworksTutorials
  class Tutorial::Post < ApplicationRecord
  
    # Clean URL Initialize
    extend FriendlyId

    # Image Upload
    has_one_attached :tutorial_post_image

    # Relationships
    has_and_belongs_to_many :categories, class_name: "Tutorial::Category", :join_table => "categories_posts", :dependent => :destroy
    has_many :steps, class_name: "Tutorial::Step"
    belongs_to :user, class_name: "PhcdevworksAccounts::User"

    # Form Fields Validation
    validates :tutorial_post_title,
      presence: true

    validates :tutorial_post_description,
      presence: true

    # Clean URL Define
    friendly_id :phcdev_tutorials_post_nice_urls, use: [:slugged, :finders]

    def phcdev_tutorials_post_nice_urls
      [:tutorial_post_title]
    end

  end
end
