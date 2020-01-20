require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

    def setup 
        create_admin_user()
    end 

    test "get new category form and create category" do 
        sign_in_as(@user, "password")
        get new_category_path
        assert_template 'categories/new'
        assert_difference 'Category.count', 1 do
            post categories_path, params:{ category: {name: "dinner"} }
            follow_redirect!
        end 
        assert_template 'categories/index'
        assert_match "dinner", response.body
    end

    test "invalid category submision results in failure" do 
        sign_in_as(@user, "password")
        get new_category_path
        assert_template 'categories/new'
        assert_no_difference 'Category.count' do
            post categories_path, params:{ category: {name: " "} }
        end 
        assert_template 'categories/new'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end 
end