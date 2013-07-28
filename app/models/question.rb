class Question < ActiveRecord::Base

  attr_accessible :query, :title

  validates :title, presence: true
  has_many :answers, :dependent => :delete_all
end
