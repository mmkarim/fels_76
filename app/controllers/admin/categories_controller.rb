class Admin::CategoriesController < ApplicationController
  before_action :admin_user, only: [:new, :edit, :update, :create]

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes(category_params)
      flash[:success] = t :lesson_updated
      redirect_to lessons_path
    else
      render :edit
    end
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t :lesson_created
      redirect_to lessons_path
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :info)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
