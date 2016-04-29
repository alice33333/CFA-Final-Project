module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_url = "chick-fil-a.jpg"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end