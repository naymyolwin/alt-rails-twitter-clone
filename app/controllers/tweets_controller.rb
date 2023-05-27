class TweetsController < ApplicationController

    def index
      @tweets = Tweet.all
      render 'tweets/index'
    end

    def create
        token = cookies.signed[:twitter_user_session_token]
        session = Session.find_by(token: token)
    
        if session
          user = session.user
          @tweet = user.tweets.new(tweet_params)
          
          if @tweet.save
            byebug
            render 'tweets/create'
          else
            render json: { success: false }
          end
        else
          render json: { success: false }
        end
    end

    def destroy
    end

    private

    def tweet_params
        params.require(:tweet).permit(:message, :user)
    end
end
