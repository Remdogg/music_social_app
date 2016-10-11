module BandtogethersHelper
  def concerts_options
    s = ''
    Concert.all.each do |concert|
      s << "<option value='#{concert.id}'>#{concert.title}</option>"
    end
    s.html_safe
  end

end
