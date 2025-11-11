require "test_helper"

class SendEmailNotificationsJobTest < ActiveJob::TestCase
  include ActionMailer::TestHelper

  test "sends emails only for unanswered surveys" do
    unanswered_surveys = Survey.unanswered
    assert_operator Survey.all.count, :>, unanswered_surveys.count

    emails = capture_emails do
      SendEmailNotificationsJob.perform_now
    end

    assert_equal unanswered_surveys.count, emails.size
    assert_equal unanswered_surveys.first.user.email, emails.first.to.first
  end
end
