#ifndef		__UNIXSOCKET_HPP__
# define	__UNIXSOCKET_HPP__

# include   <vector>
# include	<memory>
# include	<iostream>
# include	<unistd.h>
# include	<arpa/inet.h>
# include	<string.h>

class udp_socket
{
public:
    struct Datagram
    {
        std::vector<char> _data;
        size_t _lenght;
        std::string	_ip;
        int	_port;
    };
public :
    explicit udp_socket(const std::string & ip, const int port);
    Datagram readSocket();
    bool writeSocket(const Datagram & datagram);
    int getPort();
    std::string getIp();
    ~udp_socket();
private :
    int _sckt;
    std::string _ip;
    int _port;
};

# endif