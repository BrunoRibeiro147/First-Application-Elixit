defmodule Exgit.Client.Test do
  use ExUnit.Case

  import Tesla.Mock

  describe "get_repos_by_username/1" do
    test "when the user has repos, return the repos" do
      username = "BrunoRibeiro147"

      response = [
        %{"id" => 1, "name" => "my repo 1"},
        %{"id" => 1, "name" => "my repo 1"}
      ]

      expected_reponse = {:ok, response}

      mock(fn %{method: :get, url: "https://api.github.com/users/BrunoRibeiro147/repos"} ->
        %Tesla.Env{status: 200, body: response}
      end)

      assert Exgit.Client.get_repos_by_username(username) == expected_reponse

    end
  end

end
