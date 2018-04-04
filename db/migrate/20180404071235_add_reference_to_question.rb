class AddReferenceToQuestion < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :categorie, :categorie_id
  end
end
