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

  # def class_for_flash_message(key)
  #   case key
  #   when 'success' then 'alert-success'
  #   when 'error' then 'alert-danger'
  #   when 'alert' then 'alert-warning'
  #   when 'notice' then 'alert-info'
  #   else
  #     key.to_s
  #   end
  # end

  # использование таблицного метода
  FLASH_TYPES_TO_CSS_CLASS = {
    notice:  'info',
    alert:   'warning',
    error:   'danger'
  }

  def class_for_flash_message(key)
    # (FLASH_TYPES_TO_CSS_CLASS[key.to_sym]).nil? ? key : FLASH_TYPES_TO_CSS_CLASS[key.to_sym]
    FLASH_TYPES_TO_CSS_CLASS.fetch(key.to_sym, key)
  end

end
