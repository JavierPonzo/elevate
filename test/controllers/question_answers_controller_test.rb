require "test_helper"

class QuestionAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get question_answers_index_url
    assert_response :success
  end

  test "should get new" do
    get question_answers_new_url
    assert_response :success
  end

  test "should get create" do
    get question_answers_create_url
    assert_response :success
  end
end
