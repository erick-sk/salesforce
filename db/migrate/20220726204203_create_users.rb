class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name_first
      t.string :name_last
      t.integer :dob_age
      t.string :gender
      t.string :email
      t.string :nat
      t.string :picture_thumbnail

      t.timestamps
    end
  end
end
