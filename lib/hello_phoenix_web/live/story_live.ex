defmodule HelloPhoenixWeb.StoryLive do
  use HelloPhoenixWeb, :live_view

  @scenes %{
    scene_1: %{
      text: "You arrive at a mysterious gate...",
      choices: [
        %{label: "Knock", event: "choose_knock"},
        %{label: "Enter", event: "choose_enter"}
      ]
    },

    ending_a: %{
      text: "The gate slowly opens, revealing a warm light.",
      choices: []
    },

    ending_b: %{
      text: "The floor collapses beneath you as you step inside!",
      choices: []
    }
  }

  @impl true
  def mount(_params, _session, socket) do
    # Initial state
    {:ok, 
        socket
        |> assign(:scenes, @scenes)
        |> assign(:scene, :scene_1)
    }
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-6 max-w-xl mx-auto text-center">
        <h1 class="text-2xl font-bold mb-4"><%= @scenes[@scene].text %></h1>

        <%= if @scenes[@scene].choices == [] do %>

          <button phx-click="reset"
                  class="px-4 py-2 bg-gray-700 text-white rounded">
            Restart story
          </button>

          <% else %>

            <%= for choice <- @scenes[@scene].choices do %>
                <button phx-click={choice.event} 
                        class="px-4 py-2 bg-blue-600 text-white rounded m-2">
                    <%= choice.label %>
                </button>
            <% end %>

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
