# what talks to postgres

defmodule MyBlog.Repo do
  use Ecto.Repo,
    otp_app: :my_blog,
    adapter: Ecto.Adapters.Postgres
end
