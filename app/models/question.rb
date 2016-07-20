class Question < ActiveRecord::Base
 belongs_to :user
 has_many :answers
 has_many :comments, as: :commentable
 has_many :votes, as: :votable
 has_and_belongs_to_many :tags

   def tag_list
     usable_list = ""
     self.tags.each do |tag|
       usable_list += tag.subject += ", "
     end
     usable_list
   end

   def create_tags_and_associations(input)
     tags = input.split(",")
     tags.each do |tag|
       if Tag.find_by(subject: tag)
         old_tag = Tag.find_by(subject: tag)
         QuestionTag.new(question: self, tag: old_tag)
       else
         new_tag = Tag.create(subject: tag)
         QuestionTag.new(question: self, tag: new_tag)
       end
     end
   end

   def update_tags_and_associations(input)
     tags = input.split(",")
     tags.each do |tag|
       if Tag.find_by(subject: tag) && QuestionTag.find_by(question: self, tag: new_tag)
       elsif Tag.find_by(subject: tag)
           old_tag = Tag.find_by(subject: tag)
           QuestionTag.new(question: self, tag: old_tag)
       else
         new_tag = Tag.create(subject: tag)
         QuestionTag.new(question: self, tag: new_tag)
       end
     end
   end

end
