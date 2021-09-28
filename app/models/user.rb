class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions, foreign_key: 'auther_id'
  has_many :answers, foreign_key: 'auther_id'

  has_many :favorites
  has_many :favorite_questions, through: :favorites, foreign_key: 'question_id', source: :question

  def generate_jwt
    JWT.encode({ id: id, exp: 10.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end
end
