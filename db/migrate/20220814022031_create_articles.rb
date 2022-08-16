class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.references :employee, foreign_key: true, null: false
      t.datetime :deleted_at, null: true, default: nil
      t.timestamps
    end
  end
end
