defmodule RsvpWeb.EventViewTest do
    use RsvpWeb.ConnCase, async: true

    @tag current: true
    test "Should convert a date to a M/D/YY format" do
        date = ~N[2018-09-03 00:00:00]
        formatted = RsvpWeb.EventView.format_date(date)
        assert formatted == "9/3/2018"
    end

end
