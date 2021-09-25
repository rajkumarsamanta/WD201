dns_raw = File.readlines("zone")

# FILL YOUR CODE HERE
def parse_dns(raw)
    raw.
    reject {|line| line.include?("#") || line.strip.empty? }.
    map {|line| line.strip.split(", ") }.
    each_with_object({}) do |record, records|
        records[record[1]]={ :type => record[0], :destination => record[2] }
    end
end

def resolve(dns_records, lookup_chain, domain)
    record = dns_records[domain]
    if(!record)
        lookup_chain << "ERROR!! records not found for " + domain
        #return lookup_chain
    elsif  record[:type]=="A"
        lookup_chain << record[:destination]
    elsif record[:type] == "CNAME"
        domain = record[:destination]
        lookup_chain << domain
        resolve(dns_records, lookup_chain, domain)
    else
        lookup_chain << "Invalid record type for " + domain
        #return lookup_chain
    end
end    

dns_records = parse_dns(dns_raw)
domain = "google.com"
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")

# FILL YOUR CODE HERE
