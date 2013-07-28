class Question < ActiveRecord::Base

  has_many :answers, :dependent => :delete_all

  attr_accessible :query, :title

  validates :title, presence: true
end
