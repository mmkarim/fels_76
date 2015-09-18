class WordsController < ApplicationController
  def index
    @categories = Category.all
    if params[:search]
      @category = Category.find params[:search]
    end
  end

  def show
    @word = Word.find params[:id]
    @choices = @word.choices
  end
end
