class Question < ApplicationRecord
  belongs_to :auther, class_name: 'User'

  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode
  has_many :answers, foreign_key: 'question_id', dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :intrested_users, through: :favorites, foreign_key: 'user_id', source: :user, dependent: :destroy
end
