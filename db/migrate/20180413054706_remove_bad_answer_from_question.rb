class RemoveBadAnswerFromQuestion < ActiveRecord::Migration[5.1]
  def change
      remove_column :questions, :bad_answer, :string
  end
end
