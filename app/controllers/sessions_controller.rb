class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user and @user.password = params[:user][:password]
            session = @user.sessions.create
            cookies.permanent.signed[:twitter_session_token] = {
                value: session.token,
                httponly: true
            }
            render json: {
                success: true
            }
            else
              render json: {
                success: false
            }
        end
       
    end

    def authenticated
        if current_user
            render json: {
                authenticated: true,
                username: current_user.username
            }
        else
            render json: {
                authenticated: false
            }
        end
    end

    def destroy
        token = cookies.permanent.signed[:twitter_session_token]
        session = Session.find_by(token: token)
        if session and session.destroy
            render json: {
                success: true
            }
        else
            render json: {
                success: false
            }
        end
      end

end
