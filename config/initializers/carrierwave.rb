# require "carrierwave/storage/abstract"
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'
# require 'carrierwave/orm/activerecord'
# require 'fog/aws'

# CarrierWave.configure do |config|
# 	if Rails.env.staging? || Rails.env.production?
# 	  config.fog_provider = 'fog/aws'                        # required
# 	  config.fog_credentials = {
# 	    provider:              'AWS',                        # required
# 	    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required
# 	    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                        # required
# 	    region:                ENV['REGION']                # optional, defaults to 'us-east-1
# 	  }
# 	  config.fog_directory  = ENV['BUCKET']
# 	  config.storage = :fog                                  # required
# 	  config.fog_public     = false                                                 # optional, defaults to true
# 	  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
# 	# else 
# 	#   config.storage = :file
#       config.enable_processing = Rails.env.development?
#     end
# end