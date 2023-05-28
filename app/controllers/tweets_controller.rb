class TweetsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
      @tweets = Tweet.all
      render 'tweets/index'
    end

    def create   
        if logged_in?
          @tweet = current_user.tweets.new(tweet_params)
          if @tweet.save
            render 'tweets/create'
          else
            render json: { saved?: false,  }
          end
        else
          render json: { logged_in?: false }
        end
    end

    def index_by_user
      user = User.find_by(username: params[:username])
      @tweets = Tweet.where(:user_id => user.id)
      render 'tweets/index_by_user'
    end

    def destroy
      if logged_in?
        @tweet = Tweet.find_by(id: params[:id])
        if @tweet.destroy
          render json: { success: true }
        else
          render json: { success: false }
        end
      else
        render json: { success: false }
      end
    end

    private

    def tweet_params
        params.require(:tweet).permit(:message, :username, :id)
    end
end
