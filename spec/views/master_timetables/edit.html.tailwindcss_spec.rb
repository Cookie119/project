require 'rails_helper'

RSpec.describe "master_timetables/edit", type: :view do
  let(:master_timetable) {
    MasterTimetable.create!(
      subject: nil,
      teacher: nil,
      day: nil,
      time_slot: nil,
      division: nil
    )
  }

  before(:each) do
    assign(:master_timetable, master_timetable)
  end

  it "renders the edit master_timetable form" do
    render

    assert_select "form[action=?][method=?]", master_timetable_path(master_timetable), "post" do

      assert_select "input[name=?]", "master_timetable[subject_id]"

      assert_select "input[name=?]", "master_timetable[teacher_id]"

      assert_select "input[name=?]", "master_timetable[day_id]"

      assert_select "input[name=?]", "master_timetable[time_slot_id]"

      assert_select "input[name=?]", "master_timetable[division_id]"
    end
  end
end
