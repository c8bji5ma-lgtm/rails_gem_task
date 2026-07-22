require "test_helper"

class TasksFlowTest < ActionDispatch::IntegrationTest
  setup do
    @task = Task.create!(title: "Existing task", status: :todo, deadline: Date.current)
  end

  test "lists tasks" do
    get tasks_path

    assert_response :success
    assert_includes response.body, @task.title
  end

  test "creates a task" do
    assert_difference("Task.count", 1) do
      post tasks_path, params: {
        task: { title: "New task", description: "Details", status: "doing", deadline: Date.tomorrow }
      }
    end

    assert_redirected_to task_path(Task.order(:id).last)
  end

  test "updates a task" do
    patch task_path(@task), params: { task: { title: "Updated task" } }

    assert_redirected_to task_path(@task)
    assert_equal "Updated task", @task.reload.title
  end

  test "deletes a task" do
    assert_difference("Task.count", -1) do
      delete task_path(@task)
    end

    assert_redirected_to tasks_path
  end
end
