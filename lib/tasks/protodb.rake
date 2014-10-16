require 'csv'

desc 'populate the prototype table'
  task :proto, [:filename] => :environment do |task|
    CSV.foreach(:filename.path, :headers => true) do |row|
      Prototype.create!(row.to_hash)
    end
  end
