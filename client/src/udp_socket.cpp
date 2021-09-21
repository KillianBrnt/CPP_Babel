#include "../include/udp_socket.hpp"

udp_socket::udp_socket(const std::string & ip, const int port) : _ip(ip), _port(port)
{
    sockaddr_in addr = {0, 0, 0, 0, 0, 0, 0, 0};
    socklen_t addressLength = sizeof(addr);


    addr.sin_addr.s_addr = INADDR_ANY;
    addr.sin_port = htons(_port);
    addr.sin_addr.s_addr = inet_addr(_ip.c_str());
    addr.sin_family = AF_INET;

    if ( (_sckt = socket(addr.sin_family, SOCK_DGRAM, IPPROTO_UDP)) < 0 )
        throw std::string("Error ! Cannot creat the socket.");
}

udp_socket::Datagram udp_socket::readSocket()
{
    Datagram datagram;
    struct sockaddr_in s_addr = { 0, 0, 0, 0 };
    socklen_t	s_len = sizeof(s_addr);
    std::unique_ptr<char[]> buffer(new char[4096]);


    if ((datagram._lenght = recvfrom(_sckt, buffer.get(),  sizeof datagram._data - 1 ,
				    0, (struct sockaddr *)&s_addr, &s_len)) < 0)
    return datagram;

    std::cout << " [+] Received packet from " << inet_ntoa(s_addr.sin_addr)
	    << ":" <<  ntohs(s_addr.sin_port) << std::endl;

    datagram._ip = inet_ntoa(s_addr.sin_addr);
    datagram._port = ntohs(s_addr.sin_port);
   	datagram._data.insert(datagram._data.end(), buffer.get(), buffer.get() + datagram._lenght);
    return datagram;
}

bool udp_socket::writeSocket(const udp_socket::Datagram& datagram)
{
    struct sockaddr_in	s_addr =  { 0, 0, 0, 0, 0, 0, 0, 0 };
    socklen_t		s_len;

    s_addr.sin_family = AF_INET;
    s_addr.sin_addr.s_addr = inet_addr(datagram._ip.c_str());
    s_addr.sin_port = htons(datagram._port);
    s_len = sizeof(s_addr);

    if (sendto(_sckt, datagram._data.data(), datagram._lenght,
	     0, (struct sockaddr *)&s_addr, s_len) == -1)
    return false;

    std::cout << " [+] Write packet to " << inet_ntoa(s_addr.sin_addr)
	    << ":" <<  ntohs(s_addr.sin_port) << std::endl;

  return true;
}

int udp_socket::getPort() {
    return _port;
}

std::string udp_socket::getIp() {
    return _ip;
}

udp_socket::~udp_socket() {
    close(_sckt);
}