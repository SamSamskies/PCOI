module JobsHelper
  def prettify_date(date_time)
    Date.parse(date_time.split.first).strftime('%a %d %b %Y')
  end
end
