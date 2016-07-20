class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :question_tags, through: :questions
  has_many :tags

  validates :username, :email, { uniqueness: true, presence: true }
  validates :email, format: { with: /\A.*@.*com\z/, message: "Email doesn't belong to a valid domain." }
  validates :password, length: { minimum: 8 }
end
