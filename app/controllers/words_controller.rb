class WordsController < ApplicationController
  def index
    @categories = Category.all
    if params[:option]
      @category = Category.find params[:category_id]
      @words = if params[:option] == Settings.all_word
        @category.words
      else
        Word.send params[:option], current_user.id, params[:category_id]
      end
    else
      @word = []
    end
  end
end
