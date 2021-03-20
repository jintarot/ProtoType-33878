class UsersController < ApplicationController
  def edit
  end
  def update
    if User.update(user_params)
      redirect_to root_path
    end
  end
  private
  def user_params
    params.require(:user).permit(:name,:profile,:occupation,:position)
  end
end
