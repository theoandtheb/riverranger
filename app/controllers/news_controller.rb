class NewsController < ApplicationController
  skip_before_filter :require_login, only: [:index]
  def index
    @tweets = Rails.cache.fetch("twitter_feed") do
      $client.user_timeline('riverrangerca', count: 5)
    end
    #@tweets = $client.user_timeline('riverrangerca', count: 5)
  end
end
