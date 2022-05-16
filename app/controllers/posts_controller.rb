class PostsController < ApplicationController
	 before_action :authentication
	def index
		@posts = Post.all 
		render json: @posts
	end

	def show
		@post = Post.find(params[:id])
		render json: @post
	end

	def new
		@post = Post.new
	end

	def create
		# @post = current_user.posts.new(title: params[:title], :description => params[:description]) 
		@post = current_user.posts.new(post_params) 
		if @post.save
			render json: @post
		else
			render :new				
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post = @post.update(title: params[:title], :description => params[:description])  
	end

	private

	def post_params
		params.require(:post).permit(:title, :description, :user_id)
	end
end

		