require 'intercom'

class IntercomSubmission

  def self.process!(submission, form)
    if Rails.application.secrets.intercom_key
      intercom = Intercom::Client.new(token: Rails.application.secrets.intercom_key);
      submission_interests = {}
      submission.interests.thumbs_up.each_with_index do |interest, index|
        submission_interests[:"activity_#{index+1}"] = interest.activity.name
      end
      basic_attributes = {
        name: form.name,
        email: form.email,
        custom_attributes: {
          latest_submission: submission.uuid,
          postcode: submission.member.postcode,
          involvement: submission.involvement,
          activity_suggestion: submission.activity_suggestion
        }.merge(submission_interests)
      }
      if !submission.member.postcode.blank? && submission.member.postcode.strip[0,2].upcase == 'LS'
        user = intercom.users.create(basic_attributes.merge(user_id: submission.member.uuid))
        submission.member.update(intercom_id: user.id)
      else
        lead = intercom.contacts.create(basic_attributes)
        submission.member.update(intercom_id: lead.id)
      end
    else
      submission.member.update(intercom_id: 'test_environment')
    end
  end
end
