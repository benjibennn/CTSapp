class Classes < ApplicationRecord

	belongs_to :subject
	belongs_to :student
	has_many :grades
end
