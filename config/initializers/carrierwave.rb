# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|
#   config.storage = :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#     provider: 'AWS',
#     aws_access_key_id: ENV["AWS_ACCESS_KEY_ID_TASK"],
#     aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY_TASK"],    
#     region: 'ap-northeast-1'
#   }

#   config.fog_directory  = 'task-management0920'
#   config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/task-management0920'
# end