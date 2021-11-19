require 'rails_helper'

RSpec.describe "repositories/edit", type: :view do
  before(:each) do
    @repository = assign(:repository, Repository.create!(
      :url => "MyString",
      :rules => "MyText",
      :project => nil
    ))
  end

  it "renders the edit repository form" do
    render

    assert_select "form[action=?][method=?]", repository_path(@repository), "post" do

      assert_select "input[name=?]", "repository[url]"

      assert_select "textarea[name=?]", "repository[rules]"

      assert_select "input[name=?]", "repository[project_id]"
    end
  end
end
