defmodule HelloPhoenix.PageView do
  use HelloPhoenix.Web, :view

  def render("index.json", %{pages: pages}) do
    %{data: render_many(pages, HelloPhoenix.PageView, "page.json")}
  end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, HelloPhoenix.PageView, "page.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end
end
