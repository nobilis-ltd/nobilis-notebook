FactoryGirl.define do
  factory :note do
    title 'Nice little note'
    content '_Italic_ *Bold*'

    association :user, factory: :user
  end
end
