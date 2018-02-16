class FlashcardsController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.find(params[:student_id])
        @flashcard = @student.flashcards.new
    end

    def create
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.find(params[:student_id])
        @flashcard = @student.flashcards.create(flashcard_params)
        redirect_to user_course_student_path(@user, @course, @student)
    end

    def show
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:id])
        @student = @course.students.find(params[:student_id])
        @flashcard = @student.flashcard
    end

    def destroy
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.find(params[:id])
        @flashcard = @student.flashcard
        @flashcard.destroy
        redirect_to user_course_student_path(@user, @course, @student)
    end

    def edit
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.find(params[:id])
        @flashcard = @student.flashcard
    end

    def update
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.find(params[:id])
        @flashcard = @student.flashcard
     
        if @flashcard.update(flashcard_params)
            redirect_to user_course_student_path(@user, @course, @student)
        else
            render 'edit'
        end
    end
     
    private
        def flashcard_params
            params.require(:flashcard).permit(:photo, :info)
        end
end
