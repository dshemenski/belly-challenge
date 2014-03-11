class ApplicationApi < Grape::API
  format :json
  extend Napa::GrapeExtenders

  mount ChallengeApi => '/'

  add_swagger_documentation
end

