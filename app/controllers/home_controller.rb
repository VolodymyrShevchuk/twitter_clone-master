class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.paginate(:page => params[:page], :per_page => 5)
  end
end
