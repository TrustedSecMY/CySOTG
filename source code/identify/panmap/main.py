import socket

def scan_port(target_ip, port):
    try:
        # Create a socket object
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # Set timeout to 1 second
        s.settimeout(1)
        
        # Try to connect to the target IP and port
        result = s.connect_ex((target_ip, port))
        
        # If connection was successful, print that the port is open
        if result == 0:
            print(f"Port {port} is open")
        # If connection failed, print that the port is closed
        else:
            print(f"Port {port} is closed")
        
        # Close the socket
        s.close()
    except socket.error as e:
        print(f"Error: {e}")

def main():
    target_ip = input("Enter the target IP address: ")
    ports = input("Enter the ports to scan (separated by comma): ").split(',')
    
    # Convert port numbers to integers
    ports = [int(port.strip()) for port in ports]
    
    # Scan each port
    for port in ports:
        scan_port(target_ip, port)

if __name__ == "__main__":
    main()
