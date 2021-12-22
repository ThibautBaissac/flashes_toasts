class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.turbo_stream
        format.html { redirect_to @tweet, notice: "Tweet was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
