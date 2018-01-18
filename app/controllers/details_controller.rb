class DetailsController < ApplicationController

  before_action :find_submission, :redirect_if_finished

  def show
    @details_form = DetailsForm.new
  end

  def update
    @details_form = DetailsForm.new(params[:submission].to_unsafe_h)
    if @details_form.valid?
      IntercomSubmission.process!(@submission, @details_form)
      @submission.update!(finished: true)
      redirect_to submission_path(@submission)
    else
      render :show
    end
  end
end
