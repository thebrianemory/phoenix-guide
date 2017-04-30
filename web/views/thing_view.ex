defmodule HelloPhoenix.ThingView do
  use HelloPhoenix.Web, :view

  def render("index.json", %{things: things}) do
    %{data: render_many(things, HelloPhoenix.ThingView, "thing.json")}
  end

  def render("show.json", %{thing: thing}) do
    %{data: render_one(thing, HelloPhoenix.ThingView, "thing.json")}
  end

  def render("thing.json", %{thing: thing}) do
    %{id: thing.id,
      some_attr: thing.some_attr,
      another_attr: thing.another_attr}
  end
end
