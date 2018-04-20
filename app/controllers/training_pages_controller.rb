class TrainingPagesController < ApplicationController
  def new
    @difficulty = params[:start][:level].to_i
    all_question = Question.where(rank: @difficulty)
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

  def question_manage
    @questions = Question.all
    if params[:question_update]
      unless params[:question_update][:question].empty?
        question = Question.find_by_id(params[:question_update][:question])
        question.good_answers.each_with_index do |ga, i|
          unless ga.wording.eql? params[:good_answer_wording][i]
            ga.update_attributes(wording: params[:good_answer_wording][i])
          end
          unless ga.reason.eql? params[:good_answer_reason][i]
            ga.update_attributes(reason: params[:good_answer_reason][i])
          end
        end
        question.bad_answers.each_with_index do |ba, i|
          unless ba.wording.eql? params[:wrong_answer_wording][i]
            ba.update_attributes(wording: params[:wrong_answer_wording][i])
          end
          unless ba.reason.eql? params[:wrong_answer_reason][i]
            ba.update_attributes(reason: params[:wrong_answer_reason][i])
          end
        end
        unless question.rank.eql? params[:question_update][:level].to_i
          question.update_attributes(rank: params[:question_update][:level].to_i)
        end
        unless question.snippet.eql?(params[:snippet]) || params[:snippet].blank?
          question.update_attributes(snippet: params[:snippet])
        end
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
  
  def home
    
  end
end
