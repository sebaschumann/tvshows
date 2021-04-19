require "test_helper"

class NovelasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @novela = novelas(:one)
  end

  test "should get index" do
    get novelas_url
    assert_response :success
  end

  test "should get new" do
    get new_novela_url
    assert_response :success
  end

  test "should create novela" do
    assert_difference('Novela.count') do
      post novelas_url, params: { novela: { description: @novela.description, genre_id: @novela.genre_id, name: @novela.name } }
    end

    assert_redirected_to novela_url(Novela.last)
  end

  test "should show novela" do
    get novela_url(@novela)
    assert_response :success
  end

  test "should get edit" do
    get edit_novela_url(@novela)
    assert_response :success
  end

  test "should update novela" do
    patch novela_url(@novela), params: { novela: { description: @novela.description, genre_id: @novela.genre_id, name: @novela.name } }
    assert_redirected_to novela_url(@novela)
  end

  test "should destroy novela" do
    assert_difference('Novela.count', -1) do
      delete novela_url(@novela)
    end

    assert_redirected_to novelas_url
  end
end
