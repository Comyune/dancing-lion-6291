defmodule FizzbuzzServerWeb.PageControllerTest do
  use FizzbuzzServerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "FizzBuzz"
  end
end
