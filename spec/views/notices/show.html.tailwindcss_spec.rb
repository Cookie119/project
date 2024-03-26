require 'rails_helper'

RSpec.describe "notices/show", type: :view do
  before(:each) do
    assign(:notice, Notice.create!(
      title: "Title",
      content: "MyText",
      category: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
