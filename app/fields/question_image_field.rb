require "administrate/field/base"

class QuestionImageField < Administrate::Field::Base
  def to_s
    data.url
  end
  def thumb
    data.thumb.url or ""
  end
  def small
    data.small.url or ""
  end
end
