class TweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)

    p "hello"
    tweet = Tweet.find(tweet_id)
    p tweet
    user  = tweet.user
    p '------------'; p user



    client = Twitter::Client.new(
      :oauth_token => user.oauth_token,
      :oauth_token_secret => user.oauth_secret
      )

    p client
    client.update(tweet.text)
  end

end

