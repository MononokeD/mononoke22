require "shrine"
require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :validation_helpers
  plugin :store_dimensions
  plugin :cached_attachment_data
  plugin :restore_cached_data
  plugin :determine_mime_type
  plugin :pretty_location
  plugin :remove_invalid
end