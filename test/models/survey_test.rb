require "test_helper"

class SurveyTest < ActiveSupport::TestCase
  test ".unanswered returns only unanswered surveys" do
    answered_survey = surveys(:answered)
    assert answered_survey.answered_at.present?

    unanswered_survey = surveys(:unanswered)
    assert unanswered_survey.answered_at.nil?

    unanswered_surveys = Survey.unanswered
    assert_equal [ unanswered_survey ], unanswered_surveys
  end
end
