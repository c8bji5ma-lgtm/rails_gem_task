require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "defines the existing statuses" do
    assert_equal({ "todo" => 0, "doing" => 1, "done" => 2 }, Task.statuses)
  end

  test "requires title, status, and deadline" do
    task = Task.new

    assert_not task.valid?
    assert_includes task.errors[:title], "can't be blank"
    assert_includes task.errors[:status], "can't be blank"
    assert_includes task.errors[:deadline], "can't be blank"
  end

  test "accepts a valid task" do
    task = Task.new(title: "Compatibility check", status: :todo, deadline: Date.current)

    assert task.valid?
  end
end
