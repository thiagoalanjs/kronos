require 'rails_helper'

RSpec.describe "managment_risks/index", type: :view do
  before(:each) do
    assign(:managment_risks, [
      ManagmentRisk.create!(
        :title => "Title",
        : => "",
        :probability => "Probabitity",
        :contingency => "Contingency",
        :status => "Status",
        :project => nil
      ),
      ManagmentRisk.create!(
        :title => "Title",
        : => "",
        :probability => "Probabitity",
        :contingency => "Contingency",
        :status => "Status",
        :project => nil
      )
    ])
  end

  it "renders a list of managment_risks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Probabitity".to_s, :count => 2
    assert_select "tr>td", :text => "Contingency".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
