defmodule RecruitmeApi.JobSeekerTest do
  use RecruitmeApi.ModelCase

  alias RecruitmeApi.JobSeeker

  @valid_attrs %{education_level: "some content", latitude: 10.0, location: %Geo.Point{}, longitude: 10.0, skills: [], user: %RecruitmeApi.User{}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = JobSeeker.changeset(%JobSeeker{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = JobSeeker.changeset(%JobSeeker{}, @invalid_attrs)
    refute changeset.valid?
  end
end
