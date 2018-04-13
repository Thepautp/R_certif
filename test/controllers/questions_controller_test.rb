require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get questions_delete_url
    assert_response :success
  end

end
