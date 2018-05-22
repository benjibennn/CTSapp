require 'carrierwave/orm/activerecord'
# require 'fog/aws'

# CarrierWave.configure do |config|
# 	config.fog_provider = 'fog/aws'                        # required
# 	config.fog_credentials = {
# 	    provider:              'AWS',                        # required
# 	    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required
# 	    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                        # required
# 	    region:                ENV['REGION']             # optional, defaults to 'us-east-1
# 	}
# 	config.fog_directory  = ENV['BUCKET']                                # required
# 	config.fog_public     = false                                                 # optional, defaults to true
# end