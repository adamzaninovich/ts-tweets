defmodule Tay.API.PostControllerTest do
  use Tay.ConnCase
  alias Tay.Post

  setup do
    conn = conn |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "list all posts", %{conn: conn} do
    post = %Post{
      image_url: "http://example.com/img.jpg",
      content: "This is some content",
      username: "example",
      source_url: "http://example.com" }
    |> Tay.Repo.insert!

    conn = get(conn, "/api/posts")

    expected_response = %{
      total_pages: 1,
      total_entries: 1,
      page_size: 20,
      page_number: 1,
      entries: [post] }
    |> Poison.encode!
    |> Poison.Parser.parse!

    assert json_response(conn, 200) == expected_response
  end
end
