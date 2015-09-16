class Word < ActiveRecord::Base
  belongs_to :category
  has_many :choices, dependent: :destroy
  validates :category_id, presence: true
  validates :content, presence: true, length: {maximum: 80}

  OPTION = {learned: :learned, not_learned: :not_learned, all: :all}
end
