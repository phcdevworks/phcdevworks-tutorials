module PhcdevworksTutorials
  class Tutorial::Post < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Relationships
    belongs_to :category, class_name: 'PhcdevworksTutorials::Tutorial::Category'

    # Form Fields Validation
    validates :tutorial_post_title,
      presence: true

    validates :tutorial_post_text,
      presence: true

    # Clean URL Define
    friendly_id :phcdev_tutorials_post_nice_urls, use: [:slugged, :finders]

    def phcdev_tutorials_post_nice_urls
      [:tutorial_post_title]
    end

  end
end
