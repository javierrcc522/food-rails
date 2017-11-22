require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
    product = Product.create(:name => "product", :cost => "1", :country_origin => "usa" )
    review_one = Review.create(:author => 'review', :rating => '1', :content_body => 'qwqwqwqawerwaewerqqqwerqweqrqrqrwqrqwerwqrqwerqwerq', :product_id => product.id)
    visit product_path(product)
    click_link 'Edit'
    fill_in 'Author', :with => 'Chanchela'
    fill_in 'Content body', :with => 'qwqwqwqawerwaewerqqqwerqweqrqrqrwqrqwerwqrqwerqwerq'
    fill_in 'Rating', :with => '3'
    click_on 'Update Review'
    expect(page).to have_content 'Chanchela', 'qwqwqwqawerwaewerqqqwerqweqrqrqrwqrqwerwqrqwerqwerq', '3'
  end

  it "gives error when no author is entered " do
    product = Product.create(:name => "product", :cost => "1", :country_origin => "usa" )
    review_one = Review.create(:author => 'review', :rating => '1', :content_body => 'qwqwqwqawerwaewerqqqwerqweqrqrqrwqrqwerwqrqwerqwerq', :product_id => product.id)
    visit product_path(product)
    click_link 'Edit'
    fill_in 'Author', :with => ''
    click_on 'Update Review'
    expect(page).to have_content "Author can't be blank"
  end

  it "gives error when no rating is entered " do
    product = Product.create(:name => "product", :cost => "1", :country_origin => "usa" )
    review_one = Review.create(:author => 'review', :rating => '1', :content_body => 'qwqwqwqawerwaewerqqqwerqweqrqrqrwqrqwerwqrqwerqwerq', :product_id => product.id)
    visit product_path(product)
    click_link 'Edit'
    fill_in 'Rating', :with => ''
    click_on 'Update Review'
    expect(page).to have_content "Rating is not included in the list"
  end

  it "gives error when no content body is entered " do
    product = Product.create(:name => "product", :cost => "1", :country_origin => "usa" )
    review_one = Review.create(:author => 'review', :rating => '1', :content_body => 'qwqwqwqawerwaewerqqqwerqweqrqrqrwqrqwerwqrqwerqwerq', :product_id => product.id)
    visit product_path(product)
    click_link 'Edit'
    fill_in 'Content body', :with => ''
    click_on 'Update Review'
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
  end
end
