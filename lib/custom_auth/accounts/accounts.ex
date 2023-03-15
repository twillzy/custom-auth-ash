defmodule CustomAuth.Accounts do
  use Ash.Api

  resources do
    registry(CustomAuth.Accounts.Registry)
  end
end
