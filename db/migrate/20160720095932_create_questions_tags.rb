class CreateQuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags do |t|
    t.references :question, null: false, foreign_key: true, index: true
    t.references :tag, null: false, foreign_key: true, index: true

    t.timestamps( null: false )
    end
  end
end
