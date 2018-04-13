class AddSnippetToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :snippet, :string
  end
end
