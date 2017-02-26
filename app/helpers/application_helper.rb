module ApplicationHelper
  def render_hi_user
    if flash[:notice] == "Successfully authenticated from Facebook account." && user_signed_in? 
      return link_to("Hi!#{current_user.name}", edit_user_registration_path, class: "pure-menu-link")
    end
  end
end
