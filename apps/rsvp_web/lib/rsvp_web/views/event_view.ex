defmodule RsvpWeb.EventView do
    use RsvpWeb, :view

    def format_date(date) do
       {{y, m, d}, _} = Elixir.NaiveDateTime.to_erl(date)
       "#{m}/#{d}/#{y}"
    end
end
