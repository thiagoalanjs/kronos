require 'rails_helper'

RSpec.describe "managment_risks/show", type: :view do
  before(:each) do
    @managment_risk = assign(:managment_risk, ManagmentRisk.create!(
      :title => "Title",
      : => "",
      :probability => "Probabitity",
      :contingency => "Contingency",
      :status => "Status",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Probabitity/)
    expect(rendered).to match(/Contingency/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
  end
end
