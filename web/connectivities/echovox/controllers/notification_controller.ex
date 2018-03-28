defmodule Mcbk.Connectivities.Echovox.Controllers.NotificationController do
  use Mcbk.Web, :controller

  def execute(conn, params) do
    json conn, %{:notification => :controller} 
  end
end
