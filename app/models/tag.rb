class Tag < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :questions

  # validates :subject, presence: true

    def self.alphabetize
      the_class = self.all.to_a
      the_class.sort_by { |tag| tag.subject }
    end

end
