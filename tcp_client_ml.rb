require 'socket'

sock = TCPSocket.new('127.0.0.1', 65434)

sock.write 'Apr/24/2019 18:57:27 script,error 04a796fe18d770422cfe0777a4ced05f mikrotik home: CPU_Load: 0'
puts sock.read(5) # Since the response message has 5 bytes.
sock.close

