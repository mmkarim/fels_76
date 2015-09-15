class WordsController < ApplicationController
  def index
    @categories = Category.all
    if params[:search]
      @category = Category.find params[:search]
    end
  end
end
