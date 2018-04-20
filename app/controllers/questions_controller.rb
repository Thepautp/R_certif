class QuestionsController < ApplicationController
  
  def index
    
  end
  
  def new
    @categories = Categorie.all
  end
  
  def show
    # params[:continue] defined during training
    if params[:continue]
      @difficulty = params[:continue][:level].to_i
      all_question = Question.where(rank: @difficulty).where.not(id: params[:continue][:unwanted].to_i)      
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
    # params[:question_id] defined during question update => ajax
    if params[:question_id]
      question = Question.find_by_id(params[:question_id])
      if request.xhr?
        respond_to do |format|
          format.json {
            render json: {question: question, good: question.good_answers, wrong: question.bad_answers}
          }
        end
      end
    end
  end
  
  def create
    @categories = Categorie.all
    if params[:add_question]
      is_correct_question = true
      params[:add_question].each do |k,v|
        unless k.eql? "snippet"
          is_correct_question = false if v.blank?
        end
      end
      if is_correct_question
        question_to_add = Question.new( categorie_id: params[:add_question][:categorie].to_i,
                                          text: params[:add_question][:text],
                                          rank: params[:add_question][:level],
                                          snippet: params[:add_question][:snippet])
        question_to_add.save
        num_good_answer = 0
        params[:add_question].each do |k,v|
          3.times do |i|
            if k.eql? "good_answer_#{i+1}"
              num_good_answer +=1
            end
          end
        end
        num_good_answer.times do |i|
          GoodAnswer.create(question_id: question_to_add.id, wording: params[:add_question]["good_answer_#{i+1}"], reason: params[:add_question]["good_reason_#{i+1}"])
        end
        4.times do |i|
          BadAnswer.create(question_id: question_to_add.id, wording: params[:add_question]["bad_answer_#{i+1}"], reason: params[:add_question]["bad_reason_#{i+1}"])
        end        
        @msg = "Question created with success"        
      else
        @msg = "Empty field"
      end
    end  
    render "new"
  end
  
  def edit
    @questions = Question.all
  end
  
  def update
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
    @questions = Question.all
    render "edit"
  end
  
  def destroy
    unless params[:delete][:question].empty?
      question = Question.find(params[:delete][:question].to_i)
      question.destroy
    end
    redirect_to question_edit_path
  end
end
