class ApplicationController < ActionController::Base
    before_action :require_login , only:[:userprofile,:deletebooks,:newbook,:addbook]

  private

  def require_login
    logger.info ("-----------------------------this is base controller ------------------------------")
    logger.info ("------------------current_user=>#{session[:user_id]} ------------------------------")
    if session[:user_id]==nil
      flash[:alert] = "You must be logged in to process this request."
      redirect_to signin_path # halts request cycle
    end
  end
end
