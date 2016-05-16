module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title.base_title"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end


  def link_to_remove_fields label, f
    field = f.hidden_field :_destroy
    lab = content_tag(:i, "", class: "fa fa-trash-o fa-lg")
    link = link_to lab, "#", onclick: "remove_fields(this)", remote: true
    field + link
  end

  def link_to_add_fields label, f, assoc
    new_obj = f.object.class.reflect_on_association(assoc).klass.new
    fields = f.fields_for assoc, new_obj, child_index: "new_#{assoc}" do |builder|
      render "#{assoc.to_s.singularize}_fields", f: builder
    end
    lab = content_tag(:i,"",class: "fa fa-plus-square") + label
    link_to lab, "#", onclick: "add_fields(this, \"#{assoc}\",
      \"#{escape_javascript(fields)}\")", remote: true
  end

  def convert_time exam_user, duration
    if exam_user.time_end.to_i - exam_user.time_start.to_i < duration * 60
      time = exam_user.time_end.to_i - exam_user.time_start.to_i
    else
      time = duration * 60
    end
    Time.at(time).utc.strftime "%H:%M:%S"
  end

  def is_checked? ans_id, exam_user
    answer_results_ids = exam_user.results.pluck(:answer_id)
    if answer_results_ids.include? ans_id
      "checked"
    end
  end

  def correct? question, exam_user
    ans_correct_ids = question.answers.correct.pluck(:id)
    exam_user_ans_correct_ids = exam_user.results.where(question_id: question.id).pluck(:answer_id)
    if ans_correct_ids == exam_user_ans_correct_ids
      return true
    end
  end

  def no_choice question, exam_user
    ans_ids = exam_user.results.where(question: question).pluck(:answer_id)
    if ans_ids[0].nil?
      true
    end
  end
end
