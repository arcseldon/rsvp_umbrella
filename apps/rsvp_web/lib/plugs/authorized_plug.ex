defmodule RsvpWeb.AuthorizedPlug do
    import Plug.Conn
    # to use redirect we need to import the phoenix controller.
    import Phoenix.Controller

    def init(options) do
        options
    end

    def call(conn, _name) do
        user_name = conn.cookies["user_name"]
        authorize_user(conn, user_name)
    end

    defp authorize_user(conn, nil) do
        conn
        |> redirect(to: "/login")
        |> halt # prevents call more plugs
    end

    defp authorize_user(conn, user_name) do
        conn
    end

end
