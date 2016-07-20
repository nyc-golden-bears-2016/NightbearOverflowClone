class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    t.references :user, null: false, foreign_key: true, index: true
    t.references :votable, ploymorphic: true, index: true
    t.integer :value, default: 1

    t.timestamps( null: false )
    end
  end
end
