FactoryBot.define do
  factory :memory do
    title { Gimei.kanji }
    memory { Faker::Date.between(from: '2020-01-01', to: '2020-12-31')}
    diary { 'hogehogehugahugahogehuga'}
    association :user
    after(:build) do |memory|
      memory.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
