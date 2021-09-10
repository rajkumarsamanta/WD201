def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
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
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

# FILL YOUR CODE HERE
# FILL YOUR CODE HERE
def parse_dns(dns_data)
  records={}
  dns_data.each do |line|
      entryNo=records.length
      dns_row ={}
      if line.length > 1
          if line[0] != "#"
              entryNo = entryNo + 1
              items = line.split(",")
              items.each_with_index{|x,i| items[i] = x.strip}
              dns_row[entryNo] = { :type => items[0], :source => items[1], :destination => items[2] }
              records =records.merge!(dns_row)
          end
      end
  end
  return records
end

#dns_records = parse_dns(dns_raw)
def resolve(dns_records, lookup_chain, domain)
  entry = dns_records.select{|recNo, data| data[:source] == domain }
  if entry.empty?() == true
      lookup_chain.push("ERROR!! records not found for #{domain}")
  else 
      entry.each do |recNo, data|
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

# FILL YOUR CODE HERE

# FILL YOUR CODE HERE

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")