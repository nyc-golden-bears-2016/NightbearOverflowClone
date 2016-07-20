class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable, dependent: :destroy

  validates :body, :user_id, :question_id, presence: true
end
