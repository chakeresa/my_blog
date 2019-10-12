defmodule MyBlogWeb.Router do
  use MyBlogWeb, :router

  # everything in this pipeline runs before each :browser request is processed
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyBlogWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # note: scope "/" would work too
  # scope "/api", MyBlogWeb do
  #   pipe_through :api
  # end
end
