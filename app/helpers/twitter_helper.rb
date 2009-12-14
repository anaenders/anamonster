module TwitterHelper
  
  def load_twitter_client
    @twitter = Twitter::Client.from_config("#{RAILS_ROOT}/config/twitter.yml")
  end
  
  def twitter_time(time, options = {})
    start_date = options.delete(:start_date) || Time.new
    date_format = options.delete(:date_format) || :default
    delta_minutes = (start_date.to_i - time.to_i).floor / 60
    if delta_minutes.abs <= (8724 * 60)
      distance = distance_of_time_in_words(delta_minutes);
      if delta_minutes < 0
        "#{distance} from now"
      else
        "#{distance} ago"
      end
    else
      return "on #{time.to_formatted_s(date_format)}"
    end
  end

  def distance_of_time_in_words(minutes)
    case
      when minutes < 1
        "less than a minute"
      when minutes < 50
        pluralize(minutes, "minute")
      when minutes < 90
        "about one hour"
      when minutes < 1080
        "#{(minutes / 60).round} hours"
      when minutes < 1440
        "one day"
      when minutes < 2880
        "about one day"
      else
        "#{(minutes / 1440).round} days"
    end
  end
  
  def twitter_text(text)
    text.gsub(/(https?:\/\/[^\s]*)/, '<a href = "\1">\1</a>').gsub(/(\s+|^)\@([^\!\.\?\s]*)/, '\1@<a href = "http://www.twitter.com/\2">\2</a>')
  end
  
end