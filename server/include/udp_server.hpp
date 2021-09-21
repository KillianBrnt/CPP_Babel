#ifndef UDP_SERVER
# define UDP_SERVER

#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include <map>
#include <functional>
#include "udp_socket.hpp"
#include "client.hpp"

class udp_server {
private:
    std::unique_ptr<udp_socket>	_socket;
public:
    udp_server(const int port);
    ~udp_server();
    void run();
    bool addClient(udp_socket::Datagram datagram, std::vector<client> &clientArr);
    void broadcast(const std::string data, std::vector<client> &clientArr);
    void toOther(udp_socket::Datagram datagram, std::vector<client> &clientArr);
};

#endif