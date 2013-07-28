class Question < ActiveRecord::Base

  has_many :answers

  attr_accessible :query, :title

  validates :title, presence: true
end
