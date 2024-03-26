require 'rails_helper'

RSpec.describe "notices/edit", type: :view do
  let(:notice) {
    Notice.create!(
      title: "MyString",
      content: "MyText",
      category: nil
    )
  }

  before(:each) do
    assign(:notice, notice)
  end

  it "renders the edit notice form" do
    render

    assert_select "form[action=?][method=?]", notice_path(notice), "post" do

      assert_select "input[name=?]", "notice[title]"

      assert_select "textarea[name=?]", "notice[content]"

      assert_select "input[name=?]", "notice[category_id]"
    end
  end
end
