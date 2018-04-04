class AddForeignKeyToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :question, :categorie, column: :categorie, primary_key: :id
  end
end
