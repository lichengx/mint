class CreateGallery < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :state, index: true, foreign_key: true
      t.timestamps null: false
    end
    rename_column :galleries, :state_id, :picture_type_id
  end
end
