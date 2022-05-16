class CommentsController < ApplicationController

	before_action :authentication
	def index
    comments = Comment.all    
   	render json: comments, status: :ok  
  end

  def create   
    comment = Comment.create!(comment_params)    
    render json: note, status: :ok  
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update(comment_params)
      render json: note , status: :ok  
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: note, status: :ok  
  end

  def comment_params    
    params.require(:comment).permit(:title) 
  end
end
