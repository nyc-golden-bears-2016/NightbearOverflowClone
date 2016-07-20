class Tag < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :questions

  validates :subject, presence: true

    # def tag_popularity_today
    #   #assumes time being tested is a UTC ruby DateTime object
    #   tagged = []
    #   tags = QuestionTag.where(tag: self).order_by(created_at: :desc)
    #   slice at one day ago
    #   tags.each do |tag|
    #     if tag.created_at > DateTime.now.to_a[3..5] && < DateTime.now.to_a[3..5]
    #      tagged << tag
    #     end
    #   end
    #   tagged.length
    # end
    #
    # def tag_popularity_this_week
    #   #assumes time being tested is a UTC ruby DateTime object
    #   tagged = []
    #   tags = QuestionTag.where(tag: self)
    #   tags.each do |tag|
    #     if tag.created_at > DateTime.now.to_a[3..5] && < DateTime.now.to_a[3..5]
    #      tagged << tag
    #     end
    #   end
    #   tagged.length
    # end

    def self.alphabetize
      the_class = self.all.to_a
      the_class.sort_by { |tag| tag.subject }
    end

end
