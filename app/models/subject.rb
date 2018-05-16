class Subject < ApplicationRecord
	belongs_to :user
	has_many :students, through: :classes
	has_many :classes
end