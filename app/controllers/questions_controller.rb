class QuestionsController < ApplicationController
  def destroy
    unless params[:question_update][:question].empty?
      question = Question.find(params[:question_update][:question].to_i)
      question.destroy
    end
    redirect_to admin_question_path
  end
end
