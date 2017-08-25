namespace :slurp do
  desc "TODO"
  task office_data: :environment do
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "office_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      office = Office.new
      
      office.name = row["Office"]
      office.city = row["City"]
      office.state = row["State"]
      office.address = "TBD"
      office.lease_expiry = row["Expiry"]
      office.size = row["Size"]
      office.annual_cost = 0
      office.department_id = 1
      
      office.save
      puts "#{office.name} #{office.lease_expiry} #{office.annual_cost} #{office.department_id} saved"
    end
    
    puts "There are now #{Office.count} rows in the offices table"
  end
  
  task office_extra_data: :environment do
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "office_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    i = 220
    csv.each do |row|
      office = Office.find(i)
      
      office.department_id = row["Dept_ID"]
      
      office.save
      puts "#{office.name} saved"
      
      i = i + 1
    end
    
    puts "There are now #{Office.count} rows in the offices table"
  end  
  
  
  
  task department_data: :environment do
    require "csv"
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "department_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      dep = Department.new
      
      dep.name = row["Name"]
      dep.code = row["Code"]
      dep.executive_id = row["Executive"]
      
      dep.save
      puts "#{dep.code} #{dep.name} #{dep.executive_id} saved"
    end
    
    puts "There are now #{Department.count} rows in the offices table"
  end
  
  
  task organization_data: :environment do
    require "csv"
      
    csv_text = File.read(Rails.root.join("lib", "csvs", "organization_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      x = Organization.new
        
      x.name = row["Name"]
      x.details = row["Details"]
        
      x.save
      puts "#{x.name} #{x.details} saved"
    end
  
    puts "There are now #{Organization.count} rows in the offices table"
  end

  task occupancy_data: :environment do
    require "csv"
      
    csv_text = File.read(Rails.root.join("lib", "csvs", "occupancy_data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      x = Occupancy.new
        
      x.organization_id = row["Org_id"]
      x.office_id = row["Office_id"]
      x.staff_count = row["Count"]
        
      x.save
      puts "#{x.id} saved"
    end
  
    puts "There are now #{Occupancy.count} rows in the offices table"
  end
  
  task department_label: :environment do
    dept = Department.all
    dept.each do |row|
      row.label = "#{row.code}"+" - "+"#{row.name}"
        
      row.save
      puts "#{row.label} saved"
    end
  
    puts "There are now #{Department.count} rows in the table"
  end  

  task office_occ_rate: :environment do
    off = Office.all
    off.each do |row|
      row.occ_rate = row.size.to_f / row.occupancies.sum(:staff_count).to_f
        
      row.save
      puts "#{row.occ_rate} saved"
    end
  
    puts "There are now #{Office.count} rows in the table"
  end  

end
