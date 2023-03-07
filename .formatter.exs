[
  import_deps: [
    :phoenix,
    :ash,
    :ash_authentication_phoenix,
    :ash_postgres
  ],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}"]
]
