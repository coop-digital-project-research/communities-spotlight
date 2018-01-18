class MembersController < ApplicationController

  def new
  end

  def create
    if params[:location].blank?
      redirect_to new_member_path, flash: {error: 'Please enter a location'}
    else
      member = Member.create!(
        uuid: SecureRandom.hex(3),
        source: cookies[:source] || 'anonymous'
      )
      submission = member.submissions.create!(
        uuid: SecureRandom.hex(3),
        location: params[:location]
      )
      redirect_to submission_activities_path(submission)
    end
  end

  def show
    @member = Member.find_by!(uuid: params[:id])
  end

end
