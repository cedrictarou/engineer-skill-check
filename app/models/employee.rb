class Employee < ApplicationRecord
  has_secure_password

  belongs_to :office
  belongs_to :department
  has_many :profiles
  has_many :articles

  validates :number, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true
  validates :date_of_joining, presence: true

  scope :active, lambda {
    where(deleted_at: nil)
  }

  def self.csv_attributes
    %w[id department_id office_id number last_name first_name account password_digest email date_of_joining employee_info_manage_auth
       deleted_at created_at updated_at news_posting_auth]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |employee|
        csv << csv_attributes.map { |attr| employee.send(attr) }
      end
    end
  end
end
