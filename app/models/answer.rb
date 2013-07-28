class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  attr_accessible :question, :response, :title

  validates :title, presence: true
  validates :response, presence: true
end
