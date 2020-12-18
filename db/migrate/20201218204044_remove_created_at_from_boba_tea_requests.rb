class RemoveCreatedAtFromBobaTeaRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :boba_tea_requests, :created_at, :datetime
    remove_column :boba_tea_requests, :updated_at, :datetime
  end
end
