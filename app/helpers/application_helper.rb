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
end
