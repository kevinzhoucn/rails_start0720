require 'rails_helper'

RSpec.describe "products/edit", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :title => "MyString",
      :content => "MyString",
      :category_id => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_title[name=?]", "product[title]"

      assert_select "input#product_content[name=?]", "product[content]"

      assert_select "input#product_category_id[name=?]", "product[category_id]"
    end
  end
end
