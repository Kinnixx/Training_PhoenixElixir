defmodule HelloPhoenixWeb.PageController do
  use HelloPhoenixWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def bonjour(conn, _params) do
    render(conn, :bonjour)
  end
end
