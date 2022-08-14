class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :auther, foreign_key: true, null: false
      t.datetime :deleted_at, null: true, default: nil
      t.timestamps
    end
  end
end
