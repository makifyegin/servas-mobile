FactoryBot.define do
  factory :member do
    name { "Akif" }
    region
    hydra_sub { SecureRandom.uuid }
  end
end
