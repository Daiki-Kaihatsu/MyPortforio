class CommentsController < ApplicationController
  def index
    board_id = params[:board_id]
    @comments = Comment.where(board_id:board_id)
  end
  
  def show
    @comment = Comment.find(params[:id])
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

  
  def edit
    
  end
  
  def update
  
    
  end
  
  def destroy
  
    
  end
  
  private
  def comment_params
    params.require(:comment).permit(:title,:name,:question, :board_id)
  end
  
end
