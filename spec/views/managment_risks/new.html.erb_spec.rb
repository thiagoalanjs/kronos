require 'rails_helper'

RSpec.describe "managment_risks/new", type: :view do
  before(:each) do
    assign(:managment_risk, ManagmentRisk.new(
      :title => "MyString",
      : => "",
      :probabitity => "MyString",
      :contingency => "MyString",
      :status => "MyString",
      :project => nil
    ))
  end

  it "renders new managment_risk form" do
    render

    assert_select "form[action=?][method=?]", managment_risks_path, "post" do

      assert_select "input[name=?]", "managment_risk[title]"

      assert_select "input[name=?]", "managment_risk[]"

      assert_select "input[name=?]", "managment_risk[probabitity]"

      assert_select "input[name=?]", "managment_risk[contingency]"

      assert_select "input[name=?]", "managment_risk[status]"

      assert_select "input[name=?]", "managment_risk[project_id]"
    end
  end
end
