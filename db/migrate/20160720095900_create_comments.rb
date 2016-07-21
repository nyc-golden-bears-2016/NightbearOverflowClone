class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    t.text :body, null: false
    t.references :user, null: false, foreign_key: true, index: true
    t.references :commentable, polymorphic: true, index: true
    t.datetime :edited_at

    t.timestamps( null: false )
    end
  end
end
