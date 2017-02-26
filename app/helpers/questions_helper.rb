module QuestionsHelper
  def new_or_not(question)
    return ((Time.now -  question.updated_at)/86400).to_i
  end
  def question_check_mark(question)
    if user_signed_in? && Judge.exists?(["question_id = ? AND user_id = ? AND state = ?", question.id, current_user.id, 1])
      return image_tag("check1.png", id: "check")
    end
  end
end
