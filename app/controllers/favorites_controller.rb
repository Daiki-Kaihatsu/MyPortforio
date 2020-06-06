class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(board_id: params[:board_id])
    redirect_back(fallback_location: boards_path)
  end
  
  def destroy
    @board = Board.find(params[:board_id])
    @favorite = current_user.favorites.find_by(board_id:@board.id)
    @favorite.destroy
    redirect_back(fallback_location: boards_path)
  end
end