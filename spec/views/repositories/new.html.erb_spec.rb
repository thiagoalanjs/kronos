require 'rails_helper'

RSpec.describe "repositories/new", type: :view do
  before(:each) do
    assign(:repository, Repository.new(
      :url => "MyString",
      :rules => "MyText",
      :project => nil
    ))
  end

  it "renders new repository form" do
    render

    assert_select "form[action=?][method=?]", repositories_path, "post" do

      assert_select "input[name=?]", "repository[url]"

      assert_select "textarea[name=?]", "repository[rules]"

      assert_select "input[name=?]", "repository[project_id]"
    end
  end
end
