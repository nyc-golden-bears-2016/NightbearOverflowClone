class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :question, dependent: :destroy
  belongs_to :answer, dependent: :destroy
end
