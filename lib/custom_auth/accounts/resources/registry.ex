defmodule CustomAuth.Accounts.Registry do
  use Ash.Registry, extensions: [Ash.Registry.ResourceValidations]

  entries do
    entry CustomAuth.Accounts.User
    entry CustomAuth.Accounts.Token
  end
end
