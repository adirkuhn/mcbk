defmodule Mcbk.GenericController do
  use Mcbk.Web, :controller

  def index(conn, params) do
    json conn, Mcbk.Response.okResponse()
  end

  def execute(conn, params) do

    controller = get_controller_name(params["gateway"], params["controller"])
    
    case controller_exists(controller) do
      true -> do_call_controller(controller, conn, params)
      false -> json conn, Mcbk.Response.failedResponse("Invalid request")
    end
  end

  defp do_call_controller(controller, conn, params) do
    module = compile_controller(controller)
    apply(module, :execute, [conn, params])
  end

  defp get_controller_name(gateway, controller) do
    "Mcbk.Connectivities."
      <> String.capitalize(gateway)
      <> ".Controllers."
      <> String.capitalize(controller)
      <> "Controller"
  end

  defp controller_exists(controller) do
    case compile_controller(controller) do
      nil -> false
      module -> module |> Code.ensure_compiled?
    end
  end

  defp compile_controller(controller) do
    case Code.eval_string(controller) || nil do
      {module, []} -> module
      _ -> nil
    end
  end
end
