class Choice < ActiveRecord::Base
  belongs_to :word
  validates :word_id, presence: true
  validates :content, presence: true, length: {maximum:50}
end
