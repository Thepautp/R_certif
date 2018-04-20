class TrainingPagesController < ApplicationController
  
  def result
      question_id = params[:response][:question_id]
      user_answer = params[:response][:answer_id] ? params[:response][:answer_id] : ""
      
      @question = Question.find(question_id)
      good_answers = @question.good_answers.map{|g| [g.id,g.wording]}
      if user_answer.class == String
        user_answer = user_answer.split(",")
        @is_good_answer = @question.good_answers.first.id.eql?(user_answer[0].to_i) ? true : false
      else
        user_answer_arr = []
        user_answer.each do |a|
          user_answer_arr << a.split(",")
        end
        user_answer_arr.each do |a|
          a[0] = a[0].to_i
        end
        if (user_answer_arr - good_answers).empty? && (good_answers - user_answer_arr).empty?
          @is_good_answer = true
        else
          @is_good_answer = false
        end
      end
  end  
end
