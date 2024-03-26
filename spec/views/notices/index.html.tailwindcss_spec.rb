require 'rails_helper'

RSpec.describe "notices/index", type: :view do
  before(:each) do
    assign(:notices, [
      Notice.create!(
        title: "Title",
        content: "MyText",
        category: nil
      ),
      Notice.create!(
        title: "Title",
        content: "MyText",
        category: nil
      )
    ])
  end

  it "renders a list of notices" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
