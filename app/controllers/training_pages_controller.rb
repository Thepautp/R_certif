class TrainingPagesController < ApplicationController
  def new
    all_question = Question.all
    
    if all_question.empty?
      render "shared/default"
    else
      @question = all_question[rand(all_question.size)]
      @answers = []
      @question.good_answers.each do |g|
        @answers << g
      end
      @question.bad_answers.each do |b|
        @answers << b
      end
      @answers.shuffle!
    end
  end
  
  def result
      question_id = params[:response][:question_id]
      user_answer = params[:response][:answer_id]
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
  
  def add_question
    @categories = Categorie.all    
    if params[:add_question]
      wrong_answers_arr = []
      is_correct_question = true
      num_good_answer = 0
      params[:add_question].each do |k,v|
        is_correct_question = false if v.blank?
        3.times do |i|
          if k.eql? "good_answer_#{i+1}"
            num_good_answer +=1
          end
        end
      end
      if is_correct_question
        good_answers_arr = []
        num_good_answer.times do |i|
          temp = Answer.new(text: params[:add_question]["good_answer_#{i+1}"], reason: params[:add_question]["good_reason_#{i+1}"])
          temp.save!
          good_answers_arr << temp.id.to_s
        end
        wrong_answers_arr = []
        4.times do |i|
          temp = Answer.new(text: params[:add_question]["bad_answer_#{i+1}"], reason: params[:add_question]["bad_reason_#{i+1}"])
          temp.save!
          wrong_answers_arr << temp.id.to_s
        end
        good_answers = good_answers_arr.join(",")
        wrong_answers = wrong_answers_arr.join(",")
        question_to_add = Question.new( categorie_id: params[:add_question][:categorie].to_i,
                                        text: params[:add_question][:text], good_answer: good_answers,
                                        bad_answer: wrong_answers,
                                        rank: params[:add_question][:level],
                                        snippet: params[:add_question][:snippet])
        question_to_add.save
        @msg = "Question created with success"
      else
        @msg = "Empty field"
      end
    end
  end
  
  def question_manage
    @questions = Question.all
    if params[:question_update]
      question = Question.joins(:categorie).select("questions.id, questions.text, categories.label as cat, good_answer, bad_answer, rank, snippet").find_by_id(params[:question_update][:question])
      good_answers = question.good_answer.split(",").map!{ |s| s.to_i}  #array with answer_id as integer
      bad_answers = question.bad_answer.split(",").map!{ |s| s.to_i}    #array with answer_id as integer
      good_answers.each_with_index do |good, i|
        answer = Answer.find(good)
        if params[:good_answer_text][i] != answer.text || params[:good_answer_reason][i] != answer.reason
          answer.update_attributes(text: params[:good_answer_text][i], reason: params[:good_answer_reason][i])
        end
      end
      bad_answers.each_with_index do |bad,i|
        answer = Answer.find(bad)
        if params[:wrong_answer_text][i] != answer.text || params[:wrong_answer_reason][i] != answer.reason
          answer.update_attributes(text: params[:wrong_answer_text][i], reason: params[:wrong_answer_reason][i])
        end
      end
      rank = params[:question_update][:level].to_i
      question.update_attribute(:rank, rank) if question.rank != rank
      snippet = params[:snippet]
      if params[:snippet].blank?
        question.update_attribute(:snippet, nil)
      else
        question.update_attribute(:snippet, params[:snippet]) if question.snippet != params[:snippet]        
      end      
    end
  end
  
  def ajax_api
    if params[:question_id]
      question = Question.find_by_id(params[:question_id])
    end
    if request.xhr?
      respond_to do |format|
        format.json {
          render json: {question: question, good: question.good_answers, wrong: question.bad_answers}
        }
      end
    end
  end
  
end
