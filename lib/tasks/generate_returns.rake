# frozen_string_literal: true

namespace :generate_returns do
  desc 'Temp way to run generate_returns job'
  task perform: :environment do
    GenerateReturnsJob.perform_now
  end
end
