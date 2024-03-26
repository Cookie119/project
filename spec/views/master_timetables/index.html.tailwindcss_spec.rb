require 'rails_helper'

RSpec.describe "master_timetables/index", type: :view do
  before(:each) do
    assign(:master_timetables, [
      MasterTimetable.create!(
        subject: nil,
        teacher: nil,
        day: nil,
        time_slot: nil,
        division: nil
      ),
      MasterTimetable.create!(
        subject: nil,
        teacher: nil,
        day: nil,
        time_slot: nil,
        division: nil
      )
    ])
  end

  it "renders a list of master_timetables" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
