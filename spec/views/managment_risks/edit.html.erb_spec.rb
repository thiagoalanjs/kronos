require 'rails_helper'

RSpec.describe "managment_risks/edit", type: :view do
  before(:each) do
    @managment_risk = assign(:managment_risk, ManagmentRisk.create!(
      :title => "MyString",
      : => "",
      :probabitity => "MyString",
      :contingency => "MyString",
      :status => "MyString",
      :project => nil
    ))
  end

  it "renders the edit managment_risk form" do
    render

    assert_select "form[action=?][method=?]", managment_risk_path(@managment_risk), "post" do

      assert_select "input[name=?]", "managment_risk[title]"

      assert_select "input[name=?]", "managment_risk[]"

      assert_select "input[name=?]", "managment_risk[probabitity]"

      assert_select "input[name=?]", "managment_risk[contingency]"

      assert_select "input[name=?]", "managment_risk[status]"

      assert_select "input[name=?]", "managment_risk[project_id]"
    end
  end
end
