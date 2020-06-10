class BoardsController < ApplicationController
   before_action :set_board, only: [:show, :edit, :update,:destroy]
   
  def index
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    @boards = @boards.order(created_at: :desc).page(params[:page]).per(6)
  end
  
    # 検索
  def search
     params[:title].present?
     @boards = Board.where('title LIKE ?', "%#{params[:title]}%")
  end

  def show
    @board_id = Board.find(params[:id]).id
    @board_details = BoardDetail.where(board_id:@board_id)
    @comments = @board.comments
    @comment = Comment.new
  end

  def new
    @board = Board.new
   @board.board_detail.build
  end
  
  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      redirect_to user_path(@board.user_id)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    @board.update(board_params)
    redirect_to @board
  end
  
  def destroy
    @board.user_id = current_user.id
   if  @board.destroy
     redirect_to user_path(@board.user_id),notice:'削除に成功しました'
   else
    render :show
   end
  end
  

  
  
  private
  
  def set_board
      @board = Board.includes(:board_detail).find(params[:id])
  end
  
   def board_params
      params.require(:board).permit(:id,:title,:image,tag_ids: [], board_detail_attributes: [:id, :body,:image,:_destroy])
   end
end
