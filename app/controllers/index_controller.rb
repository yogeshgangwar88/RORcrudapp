class IndexController < ApplicationController
  #skip_before_action :signin_path
  
  def userprofile
      @userx = session[:user_id]
      @books=Book.where(userid:session[:user_id])
      @booksdata=Book.where(userid:session[:user_id]).to_json
  end
 
########################################
def newbook
    if params[:id]!=nil
      @newbook=Book.find(params[:id]) rescue Book.new
    else
     @newbook=Book.new 
    end
end

def addbook
msg="Added"
  if books_param[:id]==(nil||"")
    @bk=Book.new
    @bk.userid=session[:user_id]
  else
    @bk=Book.find(books_param[:id])
    msg="modified"
  end
  
  @bk.name=books_param[:name]
  @bk.author=books_param[:author]
  @bk.price=books_param[:price]
  
  if @bk.save
    flash[:success]=@bk.name+" #{msg} successfully"
    redirect_to :userprofile 
  else
    @newbook=@bk
    render :newbook 
  end
  
end
#####################################
 

def deletebooks
  if session[:user_id]!=nil && params[:id]!=nil
    bk=Book.find_by id: params[:id],userid:session[:user_id]
    puts bk.inspect
    if params[:id]!="0" && bk!=nil
      bk.delete
      flash[:alert]= bk.name+" Deleted Successfully"
    end
  end
redirect_to :userprofile
end

        private
        
        def books_param
          params.require(:book).permit(:name,:author,:price,:userid,:id)
        end
  
  end