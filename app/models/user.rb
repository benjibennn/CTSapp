class User < ApplicationRecord
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  enum role: [ :admin, :teacher, :client]

end
