module ApplicationHelper
  def render_hi_user
    if flash[:notice] == "Successfully authenticated from Facebook account." && user_signed_in? 
      return link_to("Hi! #{current_user.name}", edit_user_registration_path, class: "pure-menu-link")
    end
  end

  def render_question(q)
    return link_to(q.title, question_path(q))
  end

  def render_answer(submission)
    if submission.state == "AC"
      return content_tag(:font, "Accepted", class: "AC" )
    elsif submission.state == "WA"
      return content_tag(:font, "Wrong Answer", class: "WA" )
    elsif submission.state == "answered"
      return content_tag(:font, "Resubmitted" )
    end
  end

  def render_point_get(submission, q)
    if submission.state == "AC"
      return q.rewardpoint
    elsif submission.state == "WA"
      return q.punishpoint
    else
      return 0
    end
  end
end
