# == Schema Information
#
# Table name: imports
#
#  id             :bigint           not null, primary key
#  completed_at   :datetime
#  created_count  :integer
#  error_messages :text
#  filename       :string
#  skipped_count  :integer
#  status         :string
#  total_rows     :integer
#  user_email     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Import < ApplicationRecord
  # Валідації
  validates :user_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :status, inclusion: { in: %w[pending processing completed failed] }
  
  # Scopes
  scope :pending, -> { where(status: 'pending') }
  scope :processing, -> { where(status: 'processing') }
  scope :completed, -> { where(status: 'completed') }
  scope :failed, -> { where(status: 'failed') }
  scope :recent, -> { order(created_at: :desc) }
  
  # Методи
  def mark_as_processing!
    update!(status: 'processing')
  end
  
  def mark_as_completed!
    update!(status: 'completed', completed_at: Time.current)
  end
  
  def mark_as_failed!(error_message)
    update!(status: 'failed', errors: error_message, completed_at: Time.current)
  end
  
  def duration
    return nil unless completed_at
    completed_at - created_at
  end
  
  def success_rate
    return 0 if total_rows.zero?
    (created_count.to_f / total_rows * 100).round(2)
  end
end
