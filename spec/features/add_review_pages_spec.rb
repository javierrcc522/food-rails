require 'rails_helper'

describe "the add a review process" do
  it "adds a review" do
    product = Product.create(:name => "product", :cost => "1", :country_origin => "usa" )
    review_one = Review.create(:author => 'review', :rating => '1', :content_body => 'qwqwqwqawerwaewerqqqwerqweqrqrqrwqrqwerwqrqwerqwerq', :product_id => product.id)
    visit new_product_review_path(product)
    fill_in 'Author', :with => 'Chanchela'
    fill_in 'Content body', :with => 'qwqwqwqawerwaewerqqqwerqweqrqrqrwqrqwerwqrqwerqwerq'
    fill_in 'Rating', :with => '3'
    click_on 'Create Review'
    expect(page).to have_content 'Chanchela', 'qwqwqwqawerwaewerqqqwerqweqrqrqrwqrqwerwqrqwerqwerq', '3'
  end
end
