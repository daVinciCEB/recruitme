defmodule RecruitmeFullDataModel.JobSeekerControllerTest do
  use RecruitmeFullDataModel.ConnCase

  alias RecruitmeFullDataModel.JobSeeker
  @valid_attrs %{education_level: "some content", location: "some content", skills: []}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, job_seeker_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    job_seeker = Repo.insert! %JobSeeker{}
    conn = get conn, job_seeker_path(conn, :show, job_seeker)
    assert json_response(conn, 200)["data"] == %{"id" => job_seeker.id,
      "user_id" => job_seeker.user_id,
      "skills" => job_seeker.skills,
      "education_level" => job_seeker.education_level,
      "location" => job_seeker.location}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, job_seeker_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, job_seeker_path(conn, :create), job_seeker: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(JobSeeker, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, job_seeker_path(conn, :create), job_seeker: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    job_seeker = Repo.insert! %JobSeeker{}
    conn = put conn, job_seeker_path(conn, :update, job_seeker), job_seeker: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(JobSeeker, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    job_seeker = Repo.insert! %JobSeeker{}
    conn = put conn, job_seeker_path(conn, :update, job_seeker), job_seeker: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    job_seeker = Repo.insert! %JobSeeker{}
    conn = delete conn, job_seeker_path(conn, :delete, job_seeker)
    assert response(conn, 204)
    refute Repo.get(JobSeeker, job_seeker.id)
  end
end
