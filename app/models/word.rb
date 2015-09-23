class Word < ActiveRecord::Base
  belongs_to :category
  has_many :results
  has_many :lessons, through: :results
  has_many :choices, dependent: :destroy

  scope :learned, ->user_id, category_id{
    where("id in (select results.word_id from results join choices on results.choice_id = choices.id where choices.correct = 't' and
    lesson_id in (select id from lessons where category_id = #{category_id} and user_id = #{user_id}))")}

  scope :not_learned, ->user_id, category_id{
    where("id in(select id from words where category_id = #{category_id} and id not in (select results.word_id from results join choices on results.choice_id = choices.id where choices.correct = 't' and
    lesson_id in (select id from lessons where category_id = #{category_id} and user_id = #{user_id})))")}

  accepts_nested_attributes_for :choices,
    reject_if: proc {|attributes| attributes["content"].blank?},
    allow_destroy: true

  validates :category_id, presence: true
  validates :content, presence: true, length: {maximum: 80}
  validates_associated :choices

  OPTION = {learned: :learned, not_learned: :not_learned, all_word: :all_word}
end
