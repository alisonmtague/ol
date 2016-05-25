require 'test_helper'

# class BusinessesControllerTest < ActionController::TestCase
  describe "BusinessesControllerTest" do
    before do
      @business = Business.create(
        id: 12,
        uuid: "853d86d9-04ea-4447-b72a-e4408ef7846e",
        name: "Waters, Larkin and Nienow",
        address: "535 Schaefer Vista",
        address2: "Apt. 167",
        city: "East Griseldaville",
        zip: 40826,
        state: "NE",
        country: "US",
        phone: "6793339715",
        website: "http://upton.com/",
        created_at: "2013-06-23T10:25:48.000Z",
        updated_at: "2016-05-25T00:34:10.488Z"
      )
    end
    test "should get index" do
      get :index
      assert_response :success
    end

    test "should get show" do
      get(:show, {'id' => "12"})
      assert_response :success
    end
  end

# end
