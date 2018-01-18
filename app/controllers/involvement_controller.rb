class InvolvementController < ApplicationController

  before_action :find_submission, :redirect_if_finished

  def show
    @form = InvolvementForm.new
  end

  def update
    @form = InvolvementForm.new(params.require(:submission).to_unsafe_h)
    if @form.valid?
      @submission.update!(@form.attributes)
      redirect_to new_submission_activity_path(@submission)
    else
      render :show
    end
  end

end
