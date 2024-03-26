class AddDetailsToTeachers < ActiveRecord::Migration[7.1]
  def change
    add_column :teachers, :designation, :string
    add_column :teachers, :qualification, :string
    add_column :teachers, :area_of_expertise, :string
  end
end
