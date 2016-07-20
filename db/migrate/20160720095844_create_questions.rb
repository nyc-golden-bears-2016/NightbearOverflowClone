class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    t.string :title, null: false
    t.text :body, null: false
    t.references :user, null: false
    t.integer :total_votes, default: 0
    t.datetime :edited_at

    t.timestamps( null: false )
    end
  end
end
