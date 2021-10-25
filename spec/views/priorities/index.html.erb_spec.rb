require 'rails_helper'

RSpec.describe "priorities/index", type: :view do
  before(:each) do
    assign(:priorities, [
      Priority.create!(
        :name => "Name"
      ),
      Priority.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of priorities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
