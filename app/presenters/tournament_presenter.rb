class TournamentPresenter
  def initialize(view, tournament, options = {})
    @view = view
    @tournament = tournament
  end

  def display
    header_section +
    image_section +
    details_section +
    buttons
  end

  def top_section
    header_section +
    image_section
  end

  def header_section
    title = @view.content_tag(:h3, @tournament.title)
    @view.content_tag(:div, title + duration + location + notes, class: "cell large-8 medium-8 header-section")
  end

  def image_section
    image = @tournament.image.exists? ? @tournament.image.url(:medium) : "alt.jpg"
    @view.content_tag(:div,
      @view.image_tag(image),
      class: 'cell large-4 medium-4 img-section'
    )
  end

  private

  def location
    icon = @view.fa_icon('map-marker-alt')
    place = @tournament.venue + ', '.html_safe + @tournament.city + ', '.html_safe + @tournament.state
    make_header_item(icon + place)
  end

  def duration
    icon = @view.fa_icon('calendar-alt', type: 'regular')
    dates =
      if @tournament.start_date == @tournament.end_date
        @tournament.start_date.to_s
      else
        @tournament.start_date.to_s + ' ~ '.html_safe + @tournament.end_date.to_s
      end
    make_header_item(icon + dates)
  end

  def notes
    return ''.html_safe if @tournament.description.blank?
    icon = @view.fa_icon('sticky-note', type: 'regular')
    notes = @tournament.description
    make_header_item(icon + notes)
  end

  def make_header_item(item)
    @view.content_tag(:div, item, class: 'header-item')
  end


#  <table id="tournament_details">
#    <tr>
#      <th><%= image_tag("go.png", :size => "25x25") %></th>
#      <th><%= image_tag("hourglass.svg", :size => "25x25") %></th>
#      <th><%= image_tag("graph.svg", :size => "25x25") %></th>
#      <th><%= image_tag("usd.svg", :size => "25x25") %></th>
#    </tr>

end
