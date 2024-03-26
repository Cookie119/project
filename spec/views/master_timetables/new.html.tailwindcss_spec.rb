require 'rails_helper'

RSpec.describe "master_timetables/new", type: :view do
  before(:each) do
    assign(:master_timetable, MasterTimetable.new(
      subject: nil,
      teacher: nil,
      day: nil,
      time_slot: nil,
      division: nil
    ))
  end

  it "renders new master_timetable form" do
    render

    assert_select "form[action=?][method=?]", master_timetables_path, "post" do

      assert_select "input[name=?]", "master_timetable[subject_id]"

      assert_select "input[name=?]", "master_timetable[teacher_id]"

      assert_select "input[name=?]", "master_timetable[day_id]"

      assert_select "input[name=?]", "master_timetable[time_slot_id]"

      assert_select "input[name=?]", "master_timetable[division_id]"
    end
  end
end
