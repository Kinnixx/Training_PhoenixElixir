defmodule HelloPhoenixWeb.StoryLive do
  use HelloPhoenixWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    # Initial state
    {:ok, assign(socket, :scene, :scene_1)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-6 max-w-xl mx-auto text-center">

      <%= if @scene == :scene_1 do %>
        <h1 class="text-2xl font-bold mb-4">You arrive at a mysterious gate...</h1>

        <button phx-click="choose_knock" class="px-4 py-2 bg-blue-600 text-white rounded m-2">
          Knock
        </button>

        <button phx-click="choose_enter" class="px-4 py-2 bg-red-600 text-white rounded m-2">
          Enter
        </button>

      <% else %>

        <%= if @scene == :ending_a do %>
          <p class="text-xl">The gate slowly opens, revealing a warm light.</p>
        <% end %>

        <%= if @scene == :ending_b do %>
          <p class="text-xl">The floor collapses beneath you as you take a step inside!</p>
        <% end %>

        <div class="mt-6">
          <button phx-click="reset"
                  class="px-4 py-2 bg-gray-700 text-white rounded">
            Restart story
          </button>
        </div>

      <% end %>

    </div>
    """
  end

  @impl true
  def handle_event("choose_knock", _params, socket) do
    {:noreply, assign(socket, :scene, :ending_a)}
  end

  @impl true
  def handle_event("choose_enter", _params, socket) do
    {:noreply, assign(socket, :scene, :ending_b)}
  end

   @impl true
   def handle_event("reset", _params, socket) do
    {:noreply, assign(socket, :scene, :scene_1)}
   end
end
