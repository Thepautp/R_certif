class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :categorie
      t.string :text
      t.string :good_answer
      t.string :bad_answer
      t.integer :rank

      t.timestamps
    end
  end
end
