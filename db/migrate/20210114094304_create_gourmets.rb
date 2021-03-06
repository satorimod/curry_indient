class CreateGourmets < ActiveRecord::Migration[6.0]
  def change
    create_table :gourmets do |t|
      t.string  :name,     null: false
      t.integer :genre_id, null: false
      t.integer :area_id,  null: false
      t.text    :menu,     null: false
      t.text    :feature,  null: false
      t.text    :content,  null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
