class CreateBobaTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :boba_teas do |t|
      t.string :image
      t.string :name
      t.float :price
      t.string :type
      t.integer :purchasable, :default => 0
      t.string :description
      t.references :teahouse, foreign_key: true
    end
  end
end
