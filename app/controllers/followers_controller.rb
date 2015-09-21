class FollowersController < ApplicationController
  def index
    @title = t "followers"
    @user  = User.find params[:user_id]
    @followers = @user.followers.paginate page: params[:page]
  end
end
