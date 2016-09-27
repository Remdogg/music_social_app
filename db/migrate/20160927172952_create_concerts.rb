class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :title
      t.timestamp :start
      t.timestamp :end
      t.text :artist
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
