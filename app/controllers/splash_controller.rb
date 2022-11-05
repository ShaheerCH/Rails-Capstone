class SplashController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @title = 'REGISTER'
    return redirect_to(root_path) if user_signed_in?
  end
end
