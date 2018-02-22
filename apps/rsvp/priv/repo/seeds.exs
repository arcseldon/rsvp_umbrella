# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rsvp.Repo.insert!(%Rsvp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
unless(Rsvp.Events.any) do
    Rsvp.Events.create_event(%{date: "2018-03-18 00:00:00", title: "Paridin Birthday", location: "Mexico City"})
    Rsvp.Events.create_event(%{date: "2018-05-08 00:00:00", title: "Roberto Birthday", location: "Cuajimalpa"})
    Rsvp.Events.create_event(%{date: "2018-09-03 00:00:00", title: "Mariana Birthday", location: "Mexico City"})
    Rsvp.Events.create_event(%{date: "2019-02-06 00:00:00", title: "Rosita Birthday", location: "Cuajimalpa"})
end
