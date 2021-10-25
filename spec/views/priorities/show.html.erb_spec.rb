require 'rails_helper'

RSpec.describe "priorities/show", type: :view do
  before(:each) do
    @priority = assign(:priority, Priority.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
