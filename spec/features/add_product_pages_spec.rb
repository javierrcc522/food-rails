require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    product_one = Product.create(:name => "product", :cost => "1", :country_origin => "usa" )
    visit products_path
    click_link 'Add a New Product'
    fill_in 'Name', :with => 'Apples'
    fill_in 'Cost', :with => '3'
    fill_in 'Country origin', :with => 'America'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives error when no input is entered for name" do
    visit new_product_path
    fill_in 'Name', :with => ''
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end

  it "gives error when no input is entered for cost" do
    visit new_product_path
    fill_in 'Cost', :with => ''
    click_on 'Create Product'
    expect(page).to have_content "Cost can't be blank"
  end

  it "gives error when no input is entered for country origin" do
    visit new_product_path
    fill_in 'Country origin', :with => ''
    click_on 'Create Product'
    expect(page).to have_content "Country origin can't be blank"
  end
end
