class UsersController < ApplicationController

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
  end

  def update
    if currnet_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).parmit(:name, :email)
  end
end
