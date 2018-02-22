defmodule RsvpWeb.EventController do
    use RsvpWeb, :controller
    alias Rsvp.Events
    plug RsvpWeb.AuthorizedPlug, "create" when action in [:create]

    def show(conn, %{"id" => id}) do
        event = Events.get_event!(id)
        render conn, "details.html", event: event
    end

    def list(conn, _params) do
        events = Events.list_events()
        render conn, "list.html", events: events
    end

    def create(conn, %{errors: errors}) do
        render conn, "create.html", changeset: errors
    end

    def create(conn, _params) do
        changeset = Events.Event.changeset(%Events.Event{}, %{}) |> IO.inspect
        render conn, "create.html", changeset: changeset
    end

    def add(conn, %{"event" => event}) do
        # Fix the date adding seconds it is possible
        # creating a new update to our Map structure.
        event = Map.update!(event, "date", fn d -> d <> ":00" end)

        case Events.create_event event do
            {:ok, %{id: id}} -> redirect conn, to: event_path(conn, :show, id)
            {:error, reasons} -> create conn, %{errors: reasons}
        end
    end

    # def list_for_location(conn, %{"location" => location}) do
    #     events = Events.get_all_for_location(location)
    #     render conn, "list.html", events: events
    # end

    def reserve(conn, %{"id" => id, "reservation" => %{"quantity" => quantity}}) do
        {:ok, event} = Events.decrease_quantity(id, quantity)
        RsvpWeb.EventChannel.send_update(event)

        redirect conn, to: event_path(conn, :show, id)
    end

end


