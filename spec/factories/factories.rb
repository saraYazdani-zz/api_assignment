FactoryGirl.define do

  factory :activity do

    title       "The title"
    description "Description"
    price       100
    currency    "Canadian"
    is_active   true
    city        "Bangkok"
    country     "Thailand"
  end

  factory :availability do

    #  association :activity

    activity_id            1
    starts_at              Time.now + 1.weeks
    price                  50
    currency               "Canadian"

  end
  #
  # # after(:create) do |activity, evaluator|
  # #   FactoryGirl.create_list(:availability, evaluator.availabilities_count, activity: activity)
  # # end

end
