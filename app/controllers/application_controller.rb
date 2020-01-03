class ApplicationController < ActionController::Base
  helper_method :current_user

  private
    def current_user
      # `||=` nilならば実行される
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
