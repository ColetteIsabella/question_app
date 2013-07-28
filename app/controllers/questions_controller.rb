class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Question has been created."
      redirect_to @question
    else
      flash[:alert] = "Question has not been created."
      render action: "new"
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:notice] = "Question has been updated."
      redirect_to @question
    else
      flash[:alert] = "Question has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question has been deleted."
    redirect_to questions_path
  end
end
