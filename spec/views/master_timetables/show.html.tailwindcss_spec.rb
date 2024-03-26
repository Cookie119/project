require 'rails_helper'

RSpec.describe "master_timetables/show", type: :view do
  before(:each) do
    assign(:master_timetable, MasterTimetable.create!(
      subject: nil,
      teacher: nil,
      day: nil,
      time_slot: nil,
      division: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
