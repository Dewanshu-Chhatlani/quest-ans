class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end

    def myquestions
        @questions = current_user.questions
    end

    def show
        @question = Question.find(params[:id])
    end

    def new
        @question ||= Question.new
    end

    def edit
        @question = Question.find(params[:id])
    end

    def create
        @question = current_user.questions.create(question_params)
        if @question.save
            flash[:notice] = "Success!"
            redirect_to @question
        else
            render "new"
        end
    end

    def update
        @question = Question.find(params[:id])
        if @question.update(question_params)
          redirect_to @question
        else
          render 'edit'
        end
    end

    
    def destroy
        @question = Question.find(params[:id])
        if @question.destroy
            flash[:notice] = "Deleted!"
            redirect_to questions_myquestions_path
        end
    end

    private
        def question_params
            params.require(:question).permit(:question)
        end
end
