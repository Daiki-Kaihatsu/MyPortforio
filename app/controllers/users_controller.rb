class UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    if user_signed_in?
      
      @user = User.find(params[:id])
      @boards= params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : @user.boards.all
      @boards = @user.boards.page(params[:page]).per(6)
      
    else
      render template: "homes/index",alert:'ログインしてください'
    end
  end

  def edit
     @user = User.find(params[:id])
  end
  
  def update
     @user = User.find(params[:id])
     @user.update(user_params)
     redirect_to user_path(@user)
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name,:email,:profile,:profile_image)
    end
  
end
