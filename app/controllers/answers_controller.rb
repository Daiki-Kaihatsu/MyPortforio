class AnswersController < ApplicationController
  
  def index
    @answers = Answer.all
  end
  
  def create
    @board = Board.find(params[:board_id])
    @comment = Comment.find(params[:comment_id])
    @answer = Answer.new
    if @answer.update_attributes(answer_params)
      redirect_to board_comment_answers_path
    else
      redirect_to board_comment_answers_path
    end
  end
  
  def edit
    @board = Board.find(params[:board_id])
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.find(params[:id])
  end
  
  def update
    @board = Board.find(params[:board_id])
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to board_comment_answers_path
    else
      render :edit
    end
  end
  
  def destroy
    @board = Board.find(params[:board_id])
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.find(params[:id])
    @answer.destroy
    redirect_to board_comment_answers_path
  end
  
    private
  
    def answer_params
      params.require(:answer).permit(:name,:content,:comment_id)
    end
  
end
