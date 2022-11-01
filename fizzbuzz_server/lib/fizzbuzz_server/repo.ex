defmodule FizzbuzzServer.Repo do
  use Ecto.Repo,
    otp_app: :fizzbuzz_server,
    adapter: Ecto.Adapters.SQLite3
end
