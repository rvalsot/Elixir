# defmodule Rumbl.Repo do
#   use Ecto.Repo, otp_app: :rumbl
#
#   @doc """
#   Dynamically loads the repository url from the
#   DATABASE_URL environment variable.
#   """
#   def init(_, opts) do
#     {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
#   end
# end

defmodule Rumbl.Repo do
  @moduledoc """
    In memory repository
  """

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Sauron", username: "sauron", password: "ring"},
      %Rumbl.User{id: "2", name: "Saruman", username: "saruman", password: "white"},
      %Rumbl.User{id: "3", name: "Witch-King of Angmar", username: "witch-king", password: "sorcery"},
      %Rumbl.User{id: "4", name: "Mouth of Sauron", username: "mouth", password: "word"},
      %Rumbl.User{id: "5", name: "Balrog", username: "balrog", password: "fire"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find(all(module), fn map ->
      map.id == id
    end)
  end

  @doc """
    `get_by` looks for an User, by the given parameter, it can be any field of the structure
  """
  def get_by(module, parameter) do
    Enum.find(all(module), fn map ->
      Enum.all?(parameter, fn {key, val} ->
        Map.get(map, key) == val
      end)
    end)
  end

end
