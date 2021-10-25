require 'rails_helper'

RSpec.describe "priorities/new", type: :view do
  before(:each) do
    assign(:priority, Priority.new(
      :name => "MyString"
    ))
  end

  it "renders new priority form" do
    render

    assert_select "form[action=?][method=?]", priorities_path, "post" do

      assert_select "input[name=?]", "priority[name]"
    end
  end
end
