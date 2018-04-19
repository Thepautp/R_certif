class QuestionsController < ApplicationController
  def destroy
    unless params[:delete][:question].empty?
      question = Question.find(params[:delete][:question].to_i)
      question.destroy
    end
    redirect_to admin_question_path
  end
end
