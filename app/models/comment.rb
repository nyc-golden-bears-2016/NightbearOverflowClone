class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, dependent: :destroy
  belongs_to :answer, dependent: :destroy

  validates :body, :user_id, :commentable_id, :commentable_type, presence: true
end
