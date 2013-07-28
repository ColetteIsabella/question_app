class Question < ActiveRecord::Base
  attr_accessible :query, :title

  validates :title, presence: true
end
