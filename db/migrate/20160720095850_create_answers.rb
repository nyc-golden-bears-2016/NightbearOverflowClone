class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    t.text :body, null: false
    t.references :user, null: false, foreign_key: true, index: true
    t.references :question, null: false
    t.integer :total_votes, default: 0
    t.boolean :best_answer, default: false

    t.timestamps( null: false )
    end
  end
end
