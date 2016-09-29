class CreateBandtogethers < ActiveRecord::Migration
  def change
    create_table :bandtogethers do |t|
      t.string :title
      t.string :start_time
      t.string :end_time
      t.text :description
      t.references :concert, index: true, foreign_key: true
      t.references :organizer
      t.references :member

      t.timestamps null: false
    end
  end
end
