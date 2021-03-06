require 'rails_helper'

RSpec.describe "services/new", :type => :view do
  before(:each) do
    assign(:service, Service.new(
      :title => "MyString",
      :content => "MyString"
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_title[name=?]", "service[title]"

      assert_select "input#service_content[name=?]", "service[content]"
    end
  end
end
