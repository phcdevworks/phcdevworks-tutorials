module PhcdevworksTutorials
  class Command::Post < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksTutorials::CommandPostVersions'

    # Image Upload
    has_one_attached :post_image

    # Relationships
    has_and_belongs_to_many :categories, class_name: "Command::Category", :join_table => "phcdevworks_tutorials_categories_posts", :dependent => :destroy
    has_many :items, class_name: "Command::Item"
    belongs_to :user, class_name: "PhcdevworksAccounts::User"

    # Form Fields Validation
    validates :post_title,
      presence: true

    validates :post_description,
      presence: true

    # Clean URL Define
    friendly_id :phcdev_command_post_nice_urls, use: [:slugged, :finders]

    def phcdev_command_post_nice_urls
      [:post_title]
    end

  end
end
