class Article < ApplicationRecord
  belongs_to :employee

  validates :title, presence: true
  validates :content, presence: true
  validates :employee_id, presence: true

  scope :active, lambda {
    where(deleted_at: nil)
  }
end
