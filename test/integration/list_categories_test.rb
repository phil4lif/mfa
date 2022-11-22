require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def after_setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Music")
  end

  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
    assert true
  end
end
