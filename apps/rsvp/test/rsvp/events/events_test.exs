defmodule Rsvp.EventsTest do
  use Rsvp.DataCase

  alias Rsvp.Events

  describe "events" do
    alias Rsvp.Events.Event

    @valid_attrs %{title: "test", location: "Mexico City", date: "2018-11-22 00:00:00.0", description: "Elixir Rules."}
    @update_attrs %{title: "test updated", location: "Yautepec", date: "2018-11-22 00:00:00.0", description: "Updating..."}
    @invalid_attrs %{}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Events.create_event()
      event
    end

    test "list_events/0 returns all events" do
      # changeEvent.changeset(%Event{}, %{title: "test", location: "Mexico City", date: "2016-11-22 00:00:00"})
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Events.create_event(@valid_attrs)
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, event} = Events.update_event(event, @update_attrs)
      assert %Event{} = event
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end

    # test "get_all_for_location/0 returns all events related to location" do
    #   event = event_fixture()
    #   assert Events.get_all_for_location() == [event]
    # end

  end
end
