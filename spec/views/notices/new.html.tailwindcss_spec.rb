require 'rails_helper'

RSpec.describe "notices/new", type: :view do
  before(:each) do
    assign(:notice, Notice.new(
      title: "MyString",
      content: "MyText",
      category: nil
    ))
  end

  it "renders new notice form" do
    render

    assert_select "form[action=?][method=?]", notices_path, "post" do

      assert_select "input[name=?]", "notice[title]"

      assert_select "textarea[name=?]", "notice[content]"

      assert_select "input[name=?]", "notice[category_id]"
    end
  end
end
