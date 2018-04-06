class TrainingPagesController < ApplicationController
  def new
    all_question = Question.joins(:categorie).select("questions.id, questions.text, categories.label as cat, good_answer, bad_answer").all
    @question = all_question[rand(all_question.size)]
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
  
  def add_question
    @categories = Categorie.all
    @error = params[:error] if params[:error]
  end
  
  def add_result
    wrong_answers_arr = []
    is_correct_question = true
    params[:add_question].each do |k,v|
      is_correct_question = false if v.blank?
    end
    if is_correct_question
      good_answer_to_add = Answer.new(text: params[:add_question][:good_answer], reason: "nope")
      good_answer_to_add.save!
      wrong_answers_arr = []
      4.times do |i|
        temp = Answer.new(text: params[:add_question]["bad_answer_#{i+1}"])
        temp.save!
        wrong_answers_arr << temp.id.to_s
      end
      wrong_answers = wrong_answers_arr.join(",")
      question_to_add = Question.new(categorie_id: params[:add_question][:categorie].to_i, text: params[:add_question][:text], good_answer: good_answer_to_add.id.to_s, bad_answer: wrong_answers)
      question_to_add.save
    else
      redirect_to controler: "training_pages", action: "add_question", error: "Empty field"
    end
  end
  
  def question_manage
    
  end

end
