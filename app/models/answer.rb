class Answer < ActiveRecord::Base

  attr_accessible :question, :response, :title
  validates :title, presence: true
  validates :response, presence: true

  has_many :users
  belongs_to :question
  belongs_to :user
end
