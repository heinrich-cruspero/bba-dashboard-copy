# frozen_string_literal: true

require 'csv'

namespace :sources do
  desc 'Sources Import'
  task import: :environment do
    puts 'Start sources:import'

    CSV.foreach('lib/tasks/sources.csv', headers: false) do |row|
      source_type = SourceType.where(name: row[0]).first_or_create
      Source.where(source_type: source_type, name: row[1]).first_or_create
    end

    puts 'End sources:import'
  end
end
