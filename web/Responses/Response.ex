defmodule Mcbk.Response do  
  use Mcbk.Web, :controller

  @status_success "success"
  @status_failed "failed"

  def failedResponse(message) do
    %{
      :success => false, 
      :status => @status_failed, 
      :reason => message
    }
  end

  def okResponse() do
      %{
        :ok => :ok
      }
  end
end
