class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :response, :title

  validates :title, presence: true
  validates :response, presence: true
end
