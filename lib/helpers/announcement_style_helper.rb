# frozen_string_literal: true

# Rendering helpers for styled, rich text announcements. See
# lib/announcement_patches.rb for why this exists and when to delete it.
module AnnouncementStyleHelper
  ADMIN_ALERT_CLASSES = {
    'red' => 'alert-error',
    'yellow' => 'alert-warning',
    'green' => 'alert-success'
  }.freeze

  def announcement_as_html(announcement)
    sanitize(announcement.rich_body.to_trix_html)
  end

  def announcement_style_class(announcement)
    "announcement--style-#{announcement.style}"
  end

  def announcement_admin_alert_class(announcement)
    ADMIN_ALERT_CLASSES.fetch(announcement.style, 'alert-info')
  end
end
