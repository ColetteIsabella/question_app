class Question < ActiveRecord::Base

  attr_accessible :query, :title

  validates :title, presence: true
  has_many :answers
  has_many :users
  belongs_to :users
end
