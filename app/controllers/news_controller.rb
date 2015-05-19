class NewsController < ApplicationController
  def index
    @tweets = Rails.cache.fetch("twitter_feed") do
      $client.user_timeline('riverrangerca', count: 5)
    end
    #@tweets = $client.user_timeline('riverrangerca', count: 5)
  end
end
