class IndexController < ApplicationController
  #skip_before_action :signin_path
  def signin
    logger.info "******************* this is signin method ****************"
    if session[:user_id]!=nil
      flash[:success]="Already login"
      redirect_to "/userprofile"
    end
  end
  
  def login
        passwd = params[:password]
        emailadd = params[:email]
        validuser = User.find_by(email:emailadd)&.authenticate(passwd)
        puts validuser.inspect
  
  
      if validuser != nil && validuser
        session[:user_id] = validuser.id
        redirect_to "/userprofile"
      else
        flash.now[:alert] = 'Email or password did not match.'
        render :signin
      end
  end
  def userprofile
      @userx = session[:user_id]
      @booknew=Book.new
      @books=Book.where(userid:session[:user_id])
      
  end
 
########################################
def addbook
  @bk=Book.new
  @bk.userid=session[:user_id]
  @bk.name=books_param[:name]
  @bk.author=books_param[:author]
  @bk.price=books_param[:price]
  if @bk.save
    flash[:success]=@bk.name+" added successfully"
    redirect_to :userprofile 
  else
    @books=Book.where(userid:session[:user_id])
    @booknew=@bk
    render :userprofile 
  end
  
end
#####################################
  def register
    @usr=User.new
  end
  
def registeruser
  puts  post_params.inspect
  @usr=User.new(post_params)
  if @usr.save
    flash[:success]="Account Created Successfully"
    redirect_to "/signin" 
  else
    render :register
 
end      
end

def logout
  session[:user_id]=nil
  #flash[:success]="Logout..."
    redirect_to "/signin"
end

def deletebooks
  if session[:user_id]!=nil && params[:id]!=nil
    bk=Book.find_by(id: params[:id])
    if params[:id]!="0" && bk!=nil
      Book.delete(params[:id])
      flash[:alert]= bk.name+" Deleted Successfully"
    end
  end
redirect_to :userprofile
end

        private
        def post_params
            params.require(:user).permit(:username, :email,:password,:password_confirmation,:agreement)
        end
        def books_param
          params.require(:book).permit(:name,:author,:price,:userid)
        end
  
  end