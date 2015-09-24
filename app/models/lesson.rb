class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results
  has_many :words, through: :results

  accepts_nested_attributes_for :results

  before_create :assign_words

  scope :sort, -> {order(created_at: :desc)}

  def number_correct_choices
    results.select{|result| result.choice.try :correct}.count
  end

  private
  def assign_words
    words = self.category.words.order("RANDOM()").limit Settings.number_of_words
    words.each{|word| self.results.build word: word}
  end
end
