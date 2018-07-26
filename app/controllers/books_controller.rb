class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	# def create
	# 	book = Book.new(book_params)
	# 	book.user_id = current_user.id
 #        book.save
 #        redirect_to book_path(book.id)
	# end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
    if  @book.save
    	flash[:notice] = 'successfully created'
        redirect_to book_path(@book.id)
    else
    	@books = Book.all
    	@user = current_user
	    render :index

	end
	end


	# def create
	# @book = Book.new(book_params)
 # 	if  @book.save
 #  			#  flash[:notice] = "successfully created"
	# redirect_to user_path
	# else
 # 			#  @books = Book.all
	# @users =User.all
	# @user = User.find(params[:id])
	# @book = Book.new
	# @books = Book.all
	# render :show
	# end
	# end


	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
		@users =User.all
		# @user = User.find(params[:id])
	end

	def show
		@book = Book.new
		# @books = Book.all
		@bookf = Book.find(params[:id])
		@user = @bookf.user
	end


	def edit
		@book = Book.find(params[:id])
		@books = Book.all
	end

	# def update
	# 	book = Book.find(params[:id])
 #        book.update(book_params)
 #        redirect_to book_path(book.id)
	# end


	def update
		@book = Book.new(book_params)
		@book.user_id = current_user.id
    if  @book.save
    	flash[:notice] = 'successfully editted'
        redirect_to book_path(@book.id)
    else
    	@books = Book.all
    	@user = current_user
	    render :index
	end
	end


	# def update
	# 	book = Book.find(params[:id])
 #    if  @book.save
 #    	flash[:notice] = "successfully updated"
 #        redirect_to book_path(book.id)
 #    else
 #    	@books = Book.all
	#     render :new
	# end

	def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    private
	def book_params
	    params.require(:book).permit(:title, :opinion, :user_id, :image)
	end

end