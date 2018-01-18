require 'securerandom'

class SubmissionsController < ApplicationController

  def show
    @submission = Submission.find_by!(uuid: params[:id])
    if @submission.finished?
      render :show
    else
      redirect_to new_member_path
    end
  end

end
