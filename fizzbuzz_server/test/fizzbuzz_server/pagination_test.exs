defmodule FizzbuzzServer.PaginationTest do
  alias FizzbuzzServer.Pagination
  use ExUnit.Case

  describe "pages_to_range/2" do
    test "returns the correct start and end values given page and per-page values" do
      assert Pagination.pages_to_range(page: 1, per_page: 5) == 1..5
      assert Pagination.pages_to_range(page: 2, per_page: 5) == 6..10
    end
  end
end
