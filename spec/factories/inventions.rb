# frozen_string_literal: true

FactoryBot.define do
  factory :invention do
    sequence :id
    name { 'a' }
    power { 1 }
    scientist_id { create(:scientist).id }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
