class UsersController < ApplicationController
  skip_before_action :protect_pages, only: :show

  def show
    @user = User.find_by!(id: params[:id])
  end

  def made_admin
    Current.user.update!(role: 2)
    redirect_to products_path, notice: "You are now an admin!"
  end
end