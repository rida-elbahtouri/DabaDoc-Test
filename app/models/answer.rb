class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :auther , class_name: "User"
end
