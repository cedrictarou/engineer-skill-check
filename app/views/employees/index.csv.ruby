require 'csv'

CSV.generate do |csv| # rubocop:disable Metrics/BlockLength
  column_names = %w[id
                    department_id
                    office_id
                    number
                    last_name
                    first_name
                    account
                    password
                    email
                    date_of_joining
                    employee_info_manage_auth
                    deleted_at
                    created_at
                    updated_at
                    news_posting_auth]
  csv << column_names
  @employees.each do |employee|
    column_values = [
      employee.id,
      employee.department_id,
      employee.office_id,
      employee.number,
      employee.last_name,
      employee.first_name,
      employee.account,
      employee.password,
      employee.email,
      employee.date_of_joining,
      employee.employee_info_manage_auth,
      employee.deleted_at,
      employee.created_at,
      employee.updated_at,
      employee.news_posting_auth
    ]
    csv << column_values
  end
end
