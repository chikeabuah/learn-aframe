require 'test_helper'

class AframesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aframe = aframes(:one)
  end

  test "should get index" do
    get aframes_url
    assert_response :success
  end

  test "should get new" do
    get new_aframe_url
    assert_response :success
  end

  test "should create aframe" do
    assert_difference('Aframe.count') do
      post aframes_url, params: { aframe: { htmlcode: @aframe.htmlcode, jscode: @aframe.jscode } }
    end

    assert_redirected_to aframe_url(Aframe.last)
  end

  test "should show aframe" do
    get aframe_url(@aframe)
    assert_response :success
  end

  test "should get edit" do
    get edit_aframe_url(@aframe)
    assert_response :success
  end

  test "should update aframe" do
    patch aframe_url(@aframe), params: { aframe: { htmlcode: @aframe.htmlcode, jscode: @aframe.jscode } }
    assert_redirected_to aframe_url(@aframe)
  end

  test "should destroy aframe" do
    assert_difference('Aframe.count', -1) do
      delete aframe_url(@aframe)
    end

    assert_redirected_to aframes_url
  end
end
