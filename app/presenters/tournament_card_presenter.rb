class TournamentCardPresenter
  def initialize(view, tournament, options = {})
    @view = view
    @tournament = tournament
  end

  def display
    @view.content_tag(:div, class: "radius bordered shadow card tournament-card") do
      display_image +
      display_title +
      display_duration_and_location
    end
  end

  def display_image
    image = @tournament.image.exists? ? @tournament.image.url(:medium) : "alt.jpg"
    @view.content_tag(:div, @view.image_tag(image), class: 'img-section')
  end

  def display_title
    title = @view.link_to(@tournament.title, @view.tournament_path(@tournament), class: "card-tournament-title")
    @view.content_tag(:div, title, class: 'card-divider')
  end

  def display_duration_and_location
    duration =
      if @tournament.start_date == @tournament.end_date
        @view.content_tag(:p, @tournament.start_date.to_s)
      else
        @view.content_tag(:p, @tournament.start_date.to_s + ' ~ '.html_safe + @tournament.end_date.to_s)
      end
    location = @view.content_tag(:p, @tournament.city + ", ".html_safe + @tournament.state)

    @view.content_tag(:div, duration + location, class: 'card-section')
  end
end
