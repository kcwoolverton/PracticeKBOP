class StudentsController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.new
    end

    def create
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.create(student_params)
        redirect_to user_course_path(@user, @course)
    end

    def show
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:id])
        @student = @course.students.find(params[:id])
    end

    def destroy
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.find(params[:id])
        @student.destroy
        redirect_to user_course_path(@user, @course)
    end

    def edit
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.find(params[:id])
    end

    def update
        @user = User.find(params[:user_id])
        proper_user(@user)
        @course = @user.courses.find(params[:course_id])
        @student = @course.students.find(params[:id])
     
        if @student.update(student_params)
            redirect_to user_course_path(@user, @course)
        else
            render 'edit'
        end
    end
     
    private
        def student_params
            params.require(:student).permit(:name, :email)
        end
end
