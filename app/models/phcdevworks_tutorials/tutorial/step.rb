module PhcdevworksTutorials
  class Tutorial::Step < ApplicationRecord

    # Relationships
    belongs_to :post, class_name: "PhcdevworksTutorials::Tutorial::Post"

  end
end
