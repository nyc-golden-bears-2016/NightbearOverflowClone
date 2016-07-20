class Tag < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :questions

    # Erica working on updating this
    # def tag_used_today
    #   #assumes time being tested is a UTC ruby Time object
    #   @matching_tags = Tag.where(subject: self.subject)
    #   all_tagged = []
    #     @matching_tags.each do |tagged|
    #     today = Time.now.to_a[3..5]
    #     test_time = tagged.questions
    #     test_time.each do |ques|
    #       test_time = ques.created_at.to_a[3..5]
    #       if [today[1],today[2]] == [test_time[1],test_time[2]] && test_time[0] - today[0] <= 1
    #           all_tagged << tagged
    #       end
    #     end
    #   end
    #   all_tagged.length
    # end
    #
    # def tag_used_this_week
    #   #assumes time being tested is a UTC ruby Time object
    #   @matching_tags = Tag.where(subject: self.subject)
    #   all_tagged = []
    #     @matching_tags.each do |tagged|
    #     current_year = Time.now.to_a[5]
    #     current_week = Time.now.strftime('%U').to_i
    #     test_time = tagged.questions
    #     test_time.each do |ques|
    #       test_year = ques.created_at.to_a[5]
    #       test_week = ques.created_at.strftime('%U').to_i
    #       if current_year == test_year && test_week[0] - current_week[0] <= 1
    #           all_tagged << tagged
    #       end
    #     end
    #   end
    #   all_tagged.length
    # end
    #
    # def self.alphabetize
    #   the_class = self.all.to_a
    #   the_class.sort_by { |tag| tag.subject }
    # end

end
