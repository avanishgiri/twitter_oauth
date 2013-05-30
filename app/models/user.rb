# require_relative 'tweetworker'

class User < ActiveRecord::Base
  include Sidekiq::Worker
  has_many :tweets
  validates :username, :uniqueness => true

  def tweet(status)
    tweet = tweets.create!(:text => status)
    TweetWorker.perform_async(tweet.id)
  end

end
