class Subject < ApplicationRecord
	belongs_to :user
	has_many :students
	has_many :classes
end
