class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    t.string :subject, null: false
    t.references :user, foreign_key: true, index: true

    t.timestamps( null: false )
    end
  end
end
