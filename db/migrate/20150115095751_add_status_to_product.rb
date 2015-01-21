class AddStatusToProduct < ActiveRecord::Migration
  def change
    add_column :products, :status, :string, default: 'new'
  end
end
