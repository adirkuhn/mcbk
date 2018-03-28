defmodule Mcbk.BupperController do
  use Mcbk.Web, :controller

  def execute(conn, params) do
    response = case String.to_atom(params["action"] || "no_action") do
      :save_service -> do_save_service(params)
      _ ->  Mcbk.Response.failedResponse("Invalid action")
      nil -> Mcbk.Response.failedResponse("general error") 
    end

    json conn, response
  end

  defp do_save_service(params) do
      %{:success => true, :vida => "bela"}
  end
end
