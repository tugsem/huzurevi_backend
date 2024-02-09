require "test_helper"

class MedicationRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medication_record = medication_records(:one)
  end

  test "should get index" do
    get medication_records_url, as: :json
    assert_response :success
  end

  test "should create medication_record" do
    assert_difference("MedicationRecord.count") do
      post medication_records_url, params: { medication_record: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show medication_record" do
    get medication_record_url(@medication_record), as: :json
    assert_response :success
  end

  test "should update medication_record" do
    patch medication_record_url(@medication_record), params: { medication_record: {  } }, as: :json
    assert_response :success
  end

  test "should destroy medication_record" do
    assert_difference("MedicationRecord.count", -1) do
      delete medication_record_url(@medication_record), as: :json
    end

    assert_response :no_content
  end
end
