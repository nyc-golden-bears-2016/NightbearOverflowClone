class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates :user_id, :votable_id, :votable_type, presence: true
end
