class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end
end
