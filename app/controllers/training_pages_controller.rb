class TrainingPagesController < ApplicationController
  def new
    @question = Question.joins(:categorie).select("questions.id, questions.text, categories.label as cat, good_answer, bad_answer").first    
    bad_answer = @question.bad_answer.split(",").map!{ |s| s.to_i}    #split string into array of integer for sql request
    good_answer = @question.good_answer.split(",").map!{ |s| s.to_i}  #split string into array of integer for sql request
    @response_number = good_answer.size
    @answers = Answer.find(good_answer << bad_answer)
    @answers.shuffle!
  end
  
  def result
      question_id = params[:response][:question_id]
      @question = Question.find(question_id)                           #asked question
      good_answer_ids = @question.good_answer.split(",").map!{|s| s}  #array with good_answer ids
      bad_answer_ids = @question.bad_answer.split(",").map!{|s| s}    #array with bad_answer ids
      @bad_answers = Answer.find(bad_answer_ids)
      @good_answers = Answer.find(good_answer_ids)                    #params is an array for always having array on output
      if params[:response][:answer_id]
        response = params[:response][:answer_id].split(",")
        user_answer = response[0]
        if good_answer_ids.size == 1
          @is_good_answer = false
          @is_good_answer = true if response[0] == good_answer_ids[0]
        else
          # TODO: multiple_response case
        end
      end
  end
end
