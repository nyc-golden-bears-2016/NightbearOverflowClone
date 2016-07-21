require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

20.times do
  User.create!({ username: Faker::Superhero.name,
                email: Faker::Internet.email,
                password: 'password123' })
end

100.times do
  Question.create!({ title: Faker::Book.title,
                    body: Faker::Hipster.paragraphs,
                    user_id: rand(1..20) })
end

100.times do
  Answer.create!({ question_id: rand(1..100),
                  body: Faker::Lorem.paragraph(2),
                  user_id: rand(1..20) })
end

30.times do
  Comment.create!({ commentable_id: rand(1..100),
                    commentable_type: "Question",
                    body: Faker::Company.catch_phrase,
                    user_id: rand(1..20) })
end


80.times do
  Comment.create!({ commentable_id: rand(1..100),
                    commentable_type: "Answer",
                    body: Faker::ChuckNorris.fact,
                    user_id: rand(1..20) })
end

80.times do
  Tag.create!({ user_id: rand(1..20),
                subject: Faker::Beer.style })
end

# 80.times do
#   QuestionsTag.create!({ tag_id: rand(1..80),
#                         question_id: rand(1..100) })
# end

500.times do
  Vote.create!({ user_id: rand(1..20),
                 votable_id: rand(1..100),
                 votable_type: "Question" })
end
