require 'rails_helper'

RSpec.describe "repositories/show", type: :view do
  before(:each) do
    @repository = assign(:repository, Repository.create!(
      :url => "Url",
      :rules => "MyText",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
