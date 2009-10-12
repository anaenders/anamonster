module TwitterHelper
  
  def load_twitter_client
    @twitter = Twitter::Client.from_config("#{RAILS_ROOT}/config/twitter.yml")
  end
  
end