namespace :conjugations do
  desc "Imports all the conjugations from french-deconjugator."
  task :import => :environment do
    count = 0
    %x(french-conjugator --utf8 --all-infinitives).split("\n").each do |infinitive|
      %x(french-conjugator --utf8 "#{infinitive}").split("\n").each do |conjugations|
        next if conjugations.length == 0 || conjugations.starts_with?("-")
        conjugations.split(",").each do |conjugation|
          
          conjugation.strip!
          Conjugation.create(:content => conjugation, :verb_in_infinitive => infinitive)
        
          count += 1
          if count % 1000 == 0
            print "."
            STDOUT.flush
          end
          
        end
      end
    end
    puts "Created #{count} conjugations."
  end
  
  desc "Reports which conjugations are missing from the database."
  task :report_missing => :environment do 
    %x(french-conjugator --utf8 --all-infinitives).split("\n").each do |infinitive|
      %x(french-conjugator --utf8 "#{infinitive}").split("\n").each do |conjugations|
        next if conjugations.length == 0 || conjugations.starts_with?("-")
        conjugations.split(",").each do |conjugation|
          conjugation.strip!
          
          if Conjugation.first(:conditions => ["content = ? AND verb_in_infinitive = ?", conjugation, infinitive]).nil?
            puts "#{conjugation} - #{infinitive} is missing!"
            STDOUT.flush
          end
          
        end
      end
    end
  end
  
end
