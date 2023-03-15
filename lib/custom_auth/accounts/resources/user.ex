defmodule CustomAuth.Accounts.User do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication]

  attributes do
    uuid_primary_key(:id)
    attribute(:email, :ci_string, allow_nil?: false)
    attribute(:hashed_password, :string, allow_nil?: false, sensitive?: true)
    attribute(:username, :string, allow_nil?: false)
  end

  authentication do
    api(CustomAuth.Accounts)

    strategies do
      password :password do
        identity_field(:email)
        hashed_password_field(:hashed_password)
        confirmation_required?(false)
        register_action_accept([:username])
      end
    end

    tokens do
      enabled?(true)
      token_resource(CustomAuth.Accounts.Token)

      signing_secret(
        Application.compile_env(:custom_auth, CustomAuthWeb.Endpoint)[:secret_key_base]
      )
    end
  end

  postgres do
    table("users")
    repo(CustomAuth.Repo)
  end

  identities do
    identity(:unique_email, [:email])
    identity(:unique_username, [:username])
  end
end
