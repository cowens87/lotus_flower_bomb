class RemoveCreatedAtFromBobaTeas < ActiveRecord::Migration[5.2]
  def change
    remove_column :boba_teas, :created_at, :datetime
    remove_column :boba_teas, :updated_at, :datetime
  end
end
