class Student < ApplicationRecord
	belongs_to :user
	has_many :subjects, through: :classes
	has_many :classes
	mount_uploader :avatar, AvatarUploader
end