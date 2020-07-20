module PhcdevworksTutorials
  class Command::Post < ApplicationRecord

    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksTutorials::CommandPostVersions'

    # Image Upload
    has_one_attached :command_post_image

    # Relationships
    belongs_to :user, class_name: "PhcdevworksAccounts::User"
    belongs_to :optimization, class_name: "PhcdevworksCoreModules::Marketing::Optimization", optional: true
    has_and_belongs_to_many :categories, class_name: "PhcdevworksCoreModules::Post::Category", :join_table => "phcdevworks_tutorials_command_categories_posts"
    has_many :items, class_name: "Command::Item", :dependent => :destroy

    # Form Fields Validation
    validates :command_post_title,
      presence: true

    validates :command_post_text,
      presence: true

    # Clean URL Define
    friendly_id :command_post_nice_urls, use: [:slugged, :finders]

    def command_post_nice_urls
      [:command_post_title]
    end

  end
end
