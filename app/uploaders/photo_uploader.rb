class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 256, 256
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end
end


# url = "https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=1998822d443cf97d75258149476c5aa5&auto=format&fit=crop&w=1498&q=80"
# cocktail = Cocktail.new(name: 'Sample')
# cocktail.remote_photo_url = url
# cocktail.save
