class UserMailer < ApplicationMailer
  default from: 'bookshelf@example.com'

  # Відправка звіту про імпорт
  def import_report(import)
    @import = import
    
    mail(
      to: @import.user_email,
      subject: "Book Import Report - #{@import.status.capitalize}"
    )
  end
end
