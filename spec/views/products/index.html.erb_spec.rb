require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :title => "Title",
        :content => "Content",
        :category_id => "Category"
      ),
      Product.create!(
        :title => "Title",
        :content => "Content",
        :category_id => "Category"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
