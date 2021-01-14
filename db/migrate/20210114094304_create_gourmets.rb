class CreateGourmets < ActiveRecord::Migration[6.0]
  def change
    create_table :gourmets do |t|
      t.timestamps
    end
  end
end
