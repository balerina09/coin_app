require "test_helper"

class OperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operation = operations(:one)
    
  end

  test "should get index" do
    get category_operations_url
    assert_response :success
  end

  test "should get new" do
    get new_operation_url
    assert_response :success
  end

  test "should create operation" do
    assert_difference("Operation.count") do
      post operations_url params: { operation: { amount: @operation.amount, category_id: @operation.category_id, description: @operation.description, odate: @operation.odate, otype:@operation.otype } }
    end

    assert_redirected_to operation_url(Operation.last)
  end

  test "should show operation" do
    get category_operation_url(@operation)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_operation_url(@operation)
    assert_response :success
  end

  test "should update operation" do
    patch category_operation_url(@operation), params: { operation: { amount: @operation.amount, category_id: @operation.category_id, description: @operation.description, odate: @operation.odate, otype:@operation.otype } }
    assert_redirected_to operation_url(@operation)
  end

  test "should destroy operation" do
    assert_difference("Operation.count", -1) do
      delete category_operation_url(@operation)
    end

    assert_redirected_to operations_url
  end
end
