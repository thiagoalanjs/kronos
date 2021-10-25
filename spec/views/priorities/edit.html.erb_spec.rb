require 'rails_helper'

RSpec.describe "priorities/edit", type: :view do
  before(:each) do
    @priority = assign(:priority, Priority.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit priority form" do
    render

    assert_select "form[action=?][method=?]", priority_path(@priority), "post" do

      assert_select "input[name=?]", "priority[name]"
    end
  end
end
