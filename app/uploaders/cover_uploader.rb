class CoverUploader < Shrine
  # Плагіни для цього uploader
  plugin :remove_attachment
  plugin :pretty_location
  plugin :validation_helpers
  plugin :store_dimensions
  
  # Валідація файлів
  Attacher.validate do
    validate_max_size 5.megabytes, message: "is too large (max is 5 MB)"
    validate_mime_type %w[image/jpeg image/png image/gif image/webp]
  end
end
