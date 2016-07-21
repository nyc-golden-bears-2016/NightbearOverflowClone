class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :user_id, :votable_id, :votable_type, presence: true
end
