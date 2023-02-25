require "test_helper"

class OperationTest < ActiveSupport::TestCase

  test "check the 'operation_amount' from database" do
    operation_first = Operation.find_by(amount: 9.99)
    assert_equal(9.99, operation_first.amount)
  end

  test "return false if name is missed" do
    new_operation = Operation.new(description: "some description")
    assert_not(new_operation.valid?)
  end

  test "return true if everything is good" do
    cat = Category.first
    new_operation = cat.operations.build(amount: 65.48, odate: Date.new(2023, 01, 26), description: "tlllltthree")
    assert(new_operation.valid?)
  end

  test "saving and gathering" do
    cat = Category.first
    new_operation = cat.operations.build(amount: 65.48, odate: Date.new(2023, 01, 26), description: "tlllltthree")
    new_operation.save()
    new_oper = Operation.find_by(description: "tlllltthree")
    assert_equal("tlllltthree", new_oper.description)
  end
  
end
