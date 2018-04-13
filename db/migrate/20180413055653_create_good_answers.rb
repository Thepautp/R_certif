class CreateGoodAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :good_answers do |t|
      t.references :question, foreign_key: true
      t.string :wording
      t.string :reason

      t.timestamps
    end
  end
end
