module V1Helpers
  def widgets_response(widgets)
    {
      widgets: widgets.map { |widget|
        widget_response(widget)
      }
    }
  end

  def widget_response(widget)
    {
      id: widget.id,
      name: widget.name
    }
  end
end
