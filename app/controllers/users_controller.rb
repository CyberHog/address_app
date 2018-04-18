class UsersController < ApplicationController
  # 一覧
  def index
  	@users = User.order(:id)
  end

  # 詳細
  def show
  	@user = User.find(params[:id])
  end

  # 新規作成
  def new
  	@user = User.new
  	@user.build_address
  end

  # 新規登録
  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user, notice: "会員を登録しました"
  	else
  		render "new"
  	end
  end

  # 編集
  def edit
    @user = User.find(params[:id])
  end

  # 更新
  def update
  	@user = User.find(params[:id])
  	@user.assign_attributes(user_params)
  	if @user.save
  		redirect_to @user, notice: "会員情報を更新しました"
  	else
  		render "edit"
  	end
  end

  private
  def user_params
  	attrs = [:last_name, :first_name, :phone]
  	attrs << { address_attributes: [:id,:postcode, :prefecture, :city, :address_street, :address_building] }
  	params.require(:user).permit(attrs)
  end
end
