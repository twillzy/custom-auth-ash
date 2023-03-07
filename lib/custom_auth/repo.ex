defmodule CustomAuth.Repo do
  use AshPostgres.Repo, otp_app: :custom_auth

  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
