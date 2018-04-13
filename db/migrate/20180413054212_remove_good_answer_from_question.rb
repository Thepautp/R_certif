class RemoveGoodAnswerFromQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :good_answer, :string
  end
end
