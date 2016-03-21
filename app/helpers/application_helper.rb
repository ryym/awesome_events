module ApplicationHelper

  # Create an URL to a twitter account.
  def url_for_twitter(user)
    user && "https://twitter.com/#{user.nickname}"
  end
end
