defmodule RecruitmeLocationJsonTest.Router do
  use RecruitmeLocationJsonTest.Web, :router

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

  # scope "/", RecruitmeLocationJsonTest do
    # pipe_through :browser # Use the default browser stack

    # get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  scope "/api/v1", RecruitmeLocationJsonTest do
    pipe_through :api

    # JSON REST Routes for Users
    resources "/users", UserController, except: [:new, :edit]

    # get "/users", UserController, :index
    # get "/users/:id", UserController, :show
    # post "/users", UserController, :create
    # put "/users/:id", UserController, :update
    # delete "/users/:id", UserController, :delete

    # JSON REST Routes for Jobs (include the delete all option)
    delete "/jobs/_all", JobController, :delete_all
    resources "/jobs", JobController, except: [:new, :edit]

    # JSON REST Routes for Searching
    post "/search/jobs", JobController, :within
    post "/search/users", UserController, :within

  end
end
