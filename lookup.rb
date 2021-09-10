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
      records[record]={ :type => record[0], :source => record[1], :destination => record[2] }
  end
end

def resolve(dns_records, lookup_chain, domain)
  entry = dns_records.select{|key, data| data[:source] == domain }
  if entry.empty?() == true
      lookup_chain.push("ERROR!! records not found for #{domain}")
  else 
      entry.each do |key, data|
          if data[:type]=="A"
              lookup_chain.push(data[:destination])
          else
              domain = data[:destination]
              lookup_chain.push(domain)
              resolve(dns_records, lookup_chain, domain)
          end
      end
  end
  return lookup_chain
end    
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")