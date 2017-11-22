require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    product_one = Product.create(:name => "product", :cost => "1", :country_origin => "usa" )
    visit products_path
    click_link 'Add a New Product'
    fill_in 'Name', :with => 'Apples'
    fill_in 'Cost', :with => "3"
    fill_in 'Country origin', :with => 'America'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives error when no input is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'Please fix these errors:'
  end
end
