defmodule CustomAuth.Accounts.Token do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication.TokenResource]

  token do
    api CustomAuth.Accounts
  end

  postgres do
    table "tokens"
    repo CustomAuth.Repo
  end
end
