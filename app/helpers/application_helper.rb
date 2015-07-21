module ApplicationHelper
  def render_stylesheets
    style_url = ''
    if SiteConfig.style_url
      style_url = SiteConfig.style_url
    end

    content_tag('link', nil, { data: {turbolinks_track: true }, href: style_url, rel: 'stylesheet' }, false)
  end

  def render_page_title
    title = @page_title ? "#{@page_title} | #{SITE_NAME}" : SITE_NAME rescue "SITE_NAME"
    content_tag("title", title, nil, false)
  end
end
