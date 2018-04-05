class TrainingPagesController < ApplicationController
  def new
    @question = Question.joins(:categorie).select("questions.text, categories.label as cat, good_answer, bad_answer").first    
    bad_answer = @question.bad_answer.split(",").map!{ |s| s.to_i}    #split string into array of integer for sql request
    good_answer = @question.good_answer.split(",").map!{ |s| s.to_i}  #split string into array of integer for sql request
    @response_number = good_answer.size
    @answers = Answer.find(good_answer << bad_answer)
    @answers.shuffle!
  end
  
  def result
    if params[:response]
      response = params[:response][:answer_id].split(",")
      puts response      
    end
  end
end
