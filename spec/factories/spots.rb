FactoryBot.define do
  factory :spot do
    genre_id       {'2'}
    title          {'進撃の巨人'}
    catch_copy     {'３人の銅像と壁がありました！'}
    postal_code    {'860-1234'}
    prefecture_id  {'2'}
    city           {'日田市'}
    addresses      {'あああ'}
    association :user

    after(:build) do |spot|
      spot.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
