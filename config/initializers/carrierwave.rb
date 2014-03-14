CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAIGERREJZX35RAIMQ',       # required
    :aws_secret_access_key  => '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',
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'accomplishit-assets'
  config.storage = :fog
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end
