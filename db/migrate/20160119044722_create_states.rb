class CreateStates < ActiveRecord::Migration
  def up
    create_table :states do |t|
      t.string :name, null: false
      t.integer :seq
      t.belongs_to :type, index: true, foreign_key: true
      t.timestamps null: false
    end
    State.create_translation_table! :title => :string, :description => :text
  end
  def down
    drop_table :states
    State.drop_translation_table!
  end
end
