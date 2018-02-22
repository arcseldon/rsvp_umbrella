defmodule Rsvp.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias Elixir.NaiveDateTime
  alias Rsvp.Events.Event


  schema "events" do
    field :title, :string
    field :location, :string
    field :date, :naive_datetime
    field :description, :string
    field :quantity_available, :integer, default: 25

    timestamps()
  end

  @doc false
  def changeset(%Event{} = event, attrs) do
    event
    |> cast(attrs, [:title, :location, :date, :description])
    |> validate_required([:title, :location, :date])
    |> validate_change(:date, &must_be_future/2)
  end

  defp must_be_future(_, value) do
    NaiveDateTime.compare(value, NaiveDateTime.utc_now())
    |> get_error?
  end

  defp get_error?(comparison) when comparison == :lt do
     [date: "Cannot be in past."]
  end
  defp get_error?(_), do: []

end
