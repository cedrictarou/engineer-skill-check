class RenameAutherToAuthorInArticles < ActiveRecord::Migration[6.1]
  def up
    rename_column :articles, :auther, :author
  end

  def down
    rename_column :articles, :author, :auther
  end
end
