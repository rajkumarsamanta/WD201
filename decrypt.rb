require 'aes'

source_file = ARGV[0]
password = ARGV[1] # AES.key
decrypted = begin
    AES.decrypt(File.read(source_file), password)
    target_file = "#{source_file}.dec"
    File.open(target_file, "wb") {|f| f.write(decrypted)}
    puts "File decrypted to #{target_file} with password #{password}"
rescue OpenSSL::Cipher::CipherError
    puts "Oops! Either the password is wrong or the encrypted message has been modified."
    nil
end


