#include "../include/udp_server.hpp"

udp_server::udp_server(const int port) : _socket(std::make_unique<udp_socket>("127.0.0.1", port))
{
}

udp_server::~udp_server() {

}

void udp_server::broadcast(const std::string data, std::vector<client> &clientArr) {
    /*for(std::vector<client>::iterator it = clientArr.begin(); it != clientArr.end(); ++it) {
        udp_socket::Datagram datagram = {data, strlen(data.c_str()), it->getIp(), it->getPort()};
        _socket->writeSocket(datagram);
    }*/
}

void udp_server::toOther(udp_socket::Datagram datagram, std::vector<client> &clientArr) {
    for(std::vector<client>::iterator it = clientArr.begin(); it != clientArr.end(); ++it) {
        if (it->getPort() != datagram._port) {
            udp_socket::Datagram new_datagram = {datagram._data, sizeof(datagram._data), it->getIp(), it->getPort()};
            _socket->writeSocket(new_datagram);
        }
    }
}

bool udp_server::addClient(udp_socket::Datagram datagram, std::vector<client> &clientArr) {
    std::cout << " [+] addClient" << std::endl;
    client newClient(datagram._ip, datagram._port);
    clientArr.push_back(newClient);
    newClient.~client();
    if (clientArr.size() > 1)
        return true;
    return false;
}

void udp_server::run() {
    std::string string;
    udp_socket::Datagram datagram;
    std::vector<client> clientArr;

    while (1) {
        datagram = _socket->readSocket();
        std::string s(datagram._data.begin(), datagram._data.end());
        std::cout << s << std::endl;
        if (s.compare("502") == 0) {
            this->addClient(datagram, clientArr);
        } else {
            this->toOther(datagram, clientArr);
        }
    }
}