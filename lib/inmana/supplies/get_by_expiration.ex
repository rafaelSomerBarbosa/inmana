defmodule Inmana.Supplies.GetByExpiration do
  import Ecto.Query

  def call do
    today = Date.utc_today()
    beginning_of_week = Date.beginning_of_week(today)
    end_of_week = Date.end_of_week(today)

    query =
      from supply in Inmana.Supply,
        where:
          supply.expiration_date >= ^beginning_of_week and supply.expiration_date <= ^end_of_week,
        preload: [:restaurant]

    query
    |> Inmana.Repo.all()
    |> Enum.group_by(fn %Inmana.Supply{restaurant: %Inmana.Restaurant{email: email}} -> email end)
  end
end
