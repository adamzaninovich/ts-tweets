defmodule Tay.PostChannel do
  use Tay.Web, :channel

  def join("posts:new", _auth_msg, socket) do
    {:ok, socket}
  end
end
