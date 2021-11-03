# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener'
  end

  def full_title(page_title = '')
    base_title = 'Test Guru'
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end

  def class_for_flash_message(key)
    case key
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end

end
