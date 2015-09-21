class FollowingController < ApplicationController
  def index
    @title = t "following"
    @user  = User.find params[:user_id]
    @following = @user.following.paginate page: params[:page]
  end
end
