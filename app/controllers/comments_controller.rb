class CommentsController < ApplicationController

  def index
    board_id = params[:board_id]
    @comments = Comment.where(board_id:board_id)
    @board = Board.find(params[:board_id])
  end
  
  def show
    @comment = Comment.find(params[:id])
    
  end
  
  def new
    @comment = Comment.new
  end
  
  def edit
  end
  
  
  def create
    @comment = Comment.new(comment_params)
    @board = Board.find(params[:board_id])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to board_comments_path
    else
      redirect_to board_comments_path
    end
  end

  
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to board_comments_path
    else
      render :edit
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to board_comments_path
  end
  
  private
  def comment_params
    params.require(:comment).permit(:title,:name,:question,:board_id,comment_ids: [])
  end
  

  
end
