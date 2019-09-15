module PhcdevworksTutorials
  class Tutorial::Category < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    #Relationships
      has_many :posts, class_name: 'PhcdevworksTutorials::Tutorial::Post'

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
