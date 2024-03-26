class AddDesignationAndDepartmentToTeachers < ActiveRecord::Migration[7.1]
  def change
    add_reference :teachers, :designation, null: false, foreign_key: true
    add_reference :teachers, :department, null: false, foreign_key: true
  end
end
