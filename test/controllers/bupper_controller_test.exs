defmodule Mcbk.BupperControllerTest do
  use Mcbk.ConnCase

  test "POST with invalid action", %{conn: conn} do
    conn = post conn, "/api/v1/Bupper", %{"action" => "banana"}
    response = json_response(conn, 200)
    assert %{"reason" => "Invalid action", "status" => "failed", "success" => false} = response
  end

  test "POST without action", %{conn: conn} do
    conn = post conn, "/api/v1/Bupper", %{}
    response = json_response(conn, 200)
    assert %{"reason" => "Invalid action", "status" => "failed", "success" => false} = response
  end 
end
