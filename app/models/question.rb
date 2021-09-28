class Question < ApplicationRecord
  belongs_to :auther, class_name: 'User'
  has_many :answers, foreign_key: 'question_id'

  has_many :favorites
  has_many :intrested_users, through: :favorites, foreign_key: 'user_id', source: :user
end
