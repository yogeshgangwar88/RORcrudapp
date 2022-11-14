class IndexController < ApplicationController
  #skip_before_action :signin_path

  def userprofile
    @userx = session[:user_id]
    createlog(session[:user_id])
    @books = Book.where(userid: session[:user_id])
    @booksdata = Book.where(userid: session[:user_id]).to_json
  end

  ########################################
  def newbook
    @newbook = Book.new

    if params[:id] != nil
      bk = Book.where(:id => params[:id], :userid => session[:user_id].to_s)
      if bk.length > 0
        @newbook = bk.first
      end
    end
  end

  def addbook
    msg = "added"
    if books_param[:id] == (nil || "")
      @bk = Book.new
      @bk.userid = session[:user_id]
    else
      @bk = Book.find(books_param[:id].to_i)
      if @bk != nil
        msg = "modified"
      end
    end
    @bk.category_id = books_param[:category_id].to_i
    @bk.name = books_param[:name]
    @bk.author = books_param[:author]
    @bk.price = books_param[:price]

    respond_to do |format|
      if @bk.save
        flash.now[:success] = @bk.name + " #{msg} successfully"
        format.js
      else
        @newbook = @bk
        format.js
      end
    end
  end

  #####################################

  def deletebooks
    if session[:user_id] != nil && params[:id] != nil
      bk = Book.find_by id: params[:id], userid: session[:user_id]

      if params[:id] != "0" && bk != nil
        bk.delete
        flash.now[:alert] = bk.name + " Deleted Successfully"
      end
    end
    @booksdata = Book.where(userid: session[:user_id]).to_json
    respond_to do |format|
      format.js
    end
  end

  private

  def books_param
    params.require(:book).permit(:name, :author, :price, :userid, :id, :category_id)
  end
end
