class ImageUploader < Shrine
    plugin :remove_attachment
    plugin :processing
    plugin :versions
    plugin :delete_raw

    process(:store) do |io, context|
        original = io.download
        pipeline = ImageProcessing::MiniMagick.source(original)

        size_800 = pipeline.resize_to_limit!(800, 800)
        size_500 = pipeline.resize_to_limit!(500, 500)
        size_300 = pipeline.resize_to_limit!(300, 300)

        original.close!

        { original: io, large: size_800, medium: size_500, small: size_300 }
    end
end