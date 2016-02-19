class CreateVisitor < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.belongs_to :state, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
