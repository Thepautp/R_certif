class QuestionsController < ApplicationController
  def destroy
    unless params[:question_update][:question].empty?
      question = Question.find(params[:question_update][:question].to_i)       #question to delete
      good_answer_ids = question.good_answer.split(",").map!{|s| s}            #array with answer_id as integer
      bad_answer_ids = question.bad_answer.split(",").map!{|s| s}              #array with answer_id as integer
      
      good_answer_ids.each do|a|
        answer = Answer.find_by_id(a).destroy
      end
      bad_answer_ids.each do |a|
        answer = Answer.find_by_id(a).destroy
      end
      question.destroy
    end
    redirect_to admin_question_path
  end
end
