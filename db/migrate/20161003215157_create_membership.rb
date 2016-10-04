class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :bandtogether, index: true, foreign_key: true
    end
  end
end
