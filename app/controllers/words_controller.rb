class WordsController < ApplicationController
  def show
    @categories = Category.all
    if params[:search]
     @category = Category.find params[:search]
    end
  end
end
