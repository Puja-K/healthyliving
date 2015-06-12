class AddViewCountToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :view_count, :long
    add_index :courses, :view_count
  end
end
