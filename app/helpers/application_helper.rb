module ApplicationHelper

  def icon(name, type=nil, klass=nil)
    fa_icon(name, type: type, class: klass)
  end

  def make_tournament_detail_item(icon, item, value)
    content_tag(:div,
      content_tag(:div, icon, class: 'cell medium-1') +
      content_tag(:div, item, class: 'cell medium-5') +
      content_tag(:div, value, class: 'cell medium-6'),
    class: 'grid-x grid-margin-x tournament-detail-item')
  end

  def make_modal_close_button
    content_tag(:button,
      content_tag(:span, fa_icon('times-circle', type: 'regular'), "aria-hidden" => true),
    class: "close-button right", type: "button", "aria-label" => "close modal", data: {close: ''})
  end

  def make_modal_link(text, path)
    link_to(text, path, {"data-reveal-ajax" => true, "data-open-in" => "modal-box1" })
  end

  def organization_options
    [
      [ "American Go Association", 0 ],
      [ "Other", 99 ]
    ]
  end

  def rated_options
    [
      [ "Not rated", 0 ],
      [ "AGA rated", 1 ]
    ]
  end

  def game_rules_options
    [
      [ "AGA rules", 0 ],
      [ "Japanese rules", 1 ],
      [ "Korean rules", 2 ],
      [ "Chinese rules", 3 ],
      [ "Ing rules", 4 ],
      [ "Other", 99 ],
    ]
  end

  def rating_options
    options = []
    x = 30
    while x > 0
      options << "#{x}K"
      x -= 1
    end

    a = 1
    while a < 10
      options << "#{a}D"
      a += 1
    end
    options
  end
end
