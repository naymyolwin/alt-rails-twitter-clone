class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private
    def current_user
      token = cookies.permanent.signed[:twitter_user_session_token]
      session = Session.find_by(token: token)
      if session.present?
        @current_user = session.user
      else
        @current_user = nil
      end
      
    end

    def logged_in?
      current_user != nil
    end

end
