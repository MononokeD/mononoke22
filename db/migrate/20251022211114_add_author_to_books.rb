class AddAuthorToBooks < ActiveRecord::Migration[8.0]
  disable_ddl_transaction!

  def change
    # Додаємо посилання без блокування таблиці
    add_reference :books, :author, index: { algorithm: :concurrently }
  end
end
