module ProfilePhotoHelper
  def profile_photo(current_user, size, style_name = :thumb)
    if current_user&.avatar&.file?
      image_tag(current_user.avatar.url(style_name), size: size, class: "rounded-circle bg-dark")
    else
      image_tag('default.png', size: size, class: "rounded-circle bg-dark")
    end
  end
end
