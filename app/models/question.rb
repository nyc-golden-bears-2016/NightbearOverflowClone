class Question < ActiveRecord::Base
 belongs_to :user
 has_many :answers, dependent: :destroy
 has_many :comments, as: :commentable, dependent: :destroy
 has_many :votes, as: :votable, dependent: :destroy
 has_and_belongs_to_many :tags, dependent: :destroy

 validates :title, :body, :user_id, presence: true
 validates :title, length: { maximum: 120 }

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
       if !Tag.find_by(subject: tag.downcase)
         new_tag = Tag.create(subject: tag.downcase)
         self.tags << new_tag
       else
         old_tag = Tag.find_by(subject: tag.downcase)
         self.tags << old_tag
       end
     end
   end

   def update_tags_and_associations(input)
     tags = input.split(",")
     self.tags.delete_all
       tags.each do |tag|
        if Tag.find_by(subject: tag.downcase) && !self.tags.include?(tag)
           old_tag = Tag.find_by(subject: tag.downcase)
           self.tags << old_tag
        else
           new_tag = Tag.create(subject: tag.downcase)
           self.tags << new_tag
      end
    end
   end

end
