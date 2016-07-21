class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    t.string :title, null: false
    t.text :body, null: false
    t.references :user, null: false
    t.integer :total_votes, default: 0
    t.boolean :active_thread, default: true
    t.integer :total_views, default: 0

    t.timestamps( null: false )
    end
  end
end
