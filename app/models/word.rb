class Word < ActiveRecord::Base
  belongs_to :category
  has_many :choices, dependent: :destroy
  validates :category_id, presence: true
  validates :content, presence: true, length: {maximum: 80}

  def self.search(search)
    if search
      self.find_by category_id: search
    end
  end
end
