require 'rails_helper'

RSpec.describe "products/new", :type => :view do
  before(:each) do
    assign(:product, Product.new(
      :title => "MyString",
      :content => "MyString",
      :category_id => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_title[name=?]", "product[title]"

      assert_select "input#product_content[name=?]", "product[content]"

      assert_select "input#product_category_id[name=?]", "product[category_id]"
    end
  end
end
