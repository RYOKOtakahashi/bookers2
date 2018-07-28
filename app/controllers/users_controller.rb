class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:top, :about, :new_user_session_path, :new_user_registration_path]

	def top
	end

	def new
		@book = Book.new
	end

	def create
		book = Book.new(book_params)
        book.save
        redirect_to user_path
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

	# def create
	#     @blog= Blog.new(blog_params)
	#     if  @blog.save
	#     	flash[:notice] = "successfully created"
	#     	redirect_to blog_path(@blog.id)
	#     else
	#     	@blogs= Blog.all
	#     	render :new
	# end



	def index
		@book = Book.new
		@users =User.all
		@user = current_user
	end

	def books
	end

	def detail
	end

	def show
		@users =User.all
		@user = User.find(params[:id])
		@book = Book.new
		@books = Book.all
		
	end

	def edit
		@user = User.find(params[:id])
		@users =User.all
	end

	# def update
	# 	user = User.find(params[:id])
 #    	user.update(user_params)
 #    	redirect_to user_path
    			# redirect_to user_path(user.id)
	# end

	def update
	@user = User.find(params[:id])
 	if  @user.update(user_params)
 				#  flash[:notice] = "successfully created"
 	redirect_to user_path
 	else
  				#  @books = Book.all
	@users =User.all
	render :edit
	end
	end


	def destroy
    	@user_book = user.find(params[:id])
    	@user_book.destroy
    	redirect_to user_path
	end

	private
	def user_params
	    params.require(:user).permit(:image, :introduction, :name, :edit)
	end

end
