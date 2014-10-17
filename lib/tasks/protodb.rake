require 'csv'

desc 'populate the prototype table'
  task :proto => :environment do |task|
    CSV.foreach('lib/tasks/sh_compilation.csv', :headers => true, :encoding => 'ISO-8859-1:UTF-8') do |row|
      Prototype.create!(row.to_hash)
    end
  end

# desc "Imports a CSV file into an ActiveRecord table"
# task :csv_model_import, [:filename, :model, :needs] => :environment do |task,args|
#   lines = File.new(args[:filename]).readlines
#   header = lines.shift.strip
#   keys = header.split(',')
#   lines.each do |line|
#     values = line.strip.split(',')
#     attributes = Hash[keys.zip values]
#     Module.const_get(args[:model]).create(attributes)
#   end
# end