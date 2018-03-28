defmodule Mcbk.Router do
  use Mcbk.Web, :router

  # pipeline :browser do
  #   plug :accepts, ["html"]
  #   plug :fetch_session
  #   plug :fetch_flash
  #   plug :protect_from_forgery
  #   plug :put_secure_browser_headers
  # end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", Mcbk do
  #   pipe_through :browser # Use the default browser stack

  #   get "/", PageController, :index
  # end


  post "/api/:version/Bupper", Mcbk.BupperController, :execute
  get "/:gateway/:controller", Mcbk.GenericController, :execute
  get "/", Mcbk.GenericController, :index

  # Other scopes may use custom stacks.
  # scope "/api", Mcbk do
  #   pipe_through :api
  # end
end
