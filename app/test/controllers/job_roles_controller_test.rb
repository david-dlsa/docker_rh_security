require 'test_helper'

class JobRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_role = job_roles(:one)
  end

  test "should get index" do
    get job_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_job_role_url
    assert_response :success
  end

  test "should create job_role" do
    assert_difference('JobRole.count') do
      post job_roles_url, params: { job_role: {  } }
    end

    assert_redirected_to job_role_url(JobRole.last)
  end

  test "should show job_role" do
    get job_role_url(@job_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_role_url(@job_role)
    assert_response :success
  end

  test "should update job_role" do
    patch job_role_url(@job_role), params: { job_role: {  } }
    assert_redirected_to job_role_url(@job_role)
  end

  test "should destroy job_role" do
    assert_difference('JobRole.count', -1) do
      delete job_role_url(@job_role)
    end

    assert_redirected_to job_roles_url
  end
end
