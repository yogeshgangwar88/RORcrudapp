class UserController < ApplicationController
  def signin
    logger.info "******************* this is signin method ****************"
    if session[:user_id] != nil
      flash[:success] = "Already logged in"
      redirect_to "/dashboard"
    end
  end

  def login
    passwd = params[:password]
    emailadd = params[:email]
    validuser = User.find_by(email: emailadd)&.authenticate(passwd)
    if validuser != nil && validuser
      session[:user_id] = validuser.id
      redirect_to "/dashboard"
    else
      flash.now[:alert] = "Email or password did not match."
      render :signin
    end
  end

  def register
    session[:user_id] = nil
    @usr = User.new
  end

  def registeruser
    puts post_params.inspect
    @usr = User.new(post_params)
    if @usr.save
      flash[:success] = "Account Created Successfully"
      redirect_to "/signin"
    else
      render :register
    end
  end

  def logout
    session[:user_id] = nil
    #flash[:success]="Logout..."
    redirect_to :signin
  end

  def fbuserlogin
    session[:user_id] = postfb_params[:userid]

    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :agreement)
  end

  def postfb_params
    params.permit(:userid, :accessToken, :signedRequest)
  end
end
