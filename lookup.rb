def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
dns_raw = File.readlines("zone")

def parse_dns(raw)
  raw.
  reject {|line| line.include?("#") || line.strip.empty? }.
  map {|line| line.strip.split(", ") }.
  each_with_object({}) do |record, records|
      records[record[1]]={ :type => record[0], :source => record[1], :destination => record[2] }
  end
end

def resolve(dns_records, lookup_chain, domain)
  record = dns_records[domain]
  if(!record)
      lookup_chain << "ERROR!! records not found for " + domain
      return lookup_chain
  elsif  record[:type]=="A"
      lookup_chain << record[:destination]
  elsif record[:type] == "CNAME"
      domain = record[:destination]
      lookup_chain << domain
      resolve(dns_records, lookup_chain, domain)
  else
      lookup_chain << "Invalid record type for " + domain
      return lookup_chain
  end
end    
 
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")