class ChangeDatatypeOwnerIdOfEvents < ActiveRecord::Migration
  def change
    change_column :events, :owner_id, :integer
  end
end
