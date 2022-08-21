module ArticlesHelper
  def sort_order_desc(column, title)
    direction = params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to title, { sort: column, direction: direction }
  end
end
