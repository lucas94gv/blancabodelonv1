require "shrine"
require "shrine/storage/file_system"

Shrine.plugin :activerecord
#Shrine.plugin :logging, logger: Rails.logger

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
}

Shrine.plugin :validation_helpers

#Attacher.validate do
#  validate_max_size 1.megabyte, message: "is too large (max is 1 MB)"
#  validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png']
#end