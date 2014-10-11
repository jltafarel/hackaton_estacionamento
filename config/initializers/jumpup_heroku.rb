Jumpup::Heroku.configure do |config|
  config.app = 'hackatonestacionamento'
end if Rails.env.development?