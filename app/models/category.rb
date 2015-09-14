class Category < ActiveRecord::Base
  has_many :words, dependent: :destroy
  validates :title, presence: true, length: {maximum:50},
  uniqueness: true
end
