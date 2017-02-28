module ApplicationHelper
  def render_hi_user
    if flash[:notice] == "Successfully authenticated from Facebook account." && user_signed_in? 
      return link_to("Hi!#{current_user.name}", edit_user_registration_path, class: "pure-menu-link")
    end
  end

  def render_question(q)
    return link_to(q.title, question_path(q))
  end

  def render_answer(submission, q)
    if q.answer == submission.answer
      return content_tag(:font, "Accepted", class: "AC" )
    else
      return content_tag(:font, "Wrong Answer", class: "WA" )
    end
  end

  def render_point_get(submission, q)
    if q.answer == submission.answer
      return q.rewardpoint
    else
      return q.punishpoint
    end
  end
end
