class Article < ApplicationRecord
  belongs_to :employees

  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true
  
end
