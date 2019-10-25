module PhcdevworksTutorials
  class Tutorial::Category < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    #Relationships
    has_and_belongs_to_many :posts, class_name: "Tutorial::Post", :join_table => "phcdevworks_tutorials_categories_posts", :dependent => :destroy

    # Form Fields Validation
    validates :tutorial_category_name,
      presence: true,
      uniqueness: true

    # Clean URL Define
    friendly_id :phcdev_tutorials_category_nice_urls, use: [:slugged, :finders]

    def phcdev_tutorials_category_nice_urls
      [:tutorial_category_name]
    end

  end
end
