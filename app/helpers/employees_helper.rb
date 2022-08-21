module EmployeesHelper
  def sort_order_asc(column, title)
    direction = params[:direction] == 'desc' ? 'asc' : 'desc'
    link_to title, { sort: column, direction: direction }
  end
end
