#include "../include/client.hpp"

client::client(const std::string & ip, const int port) : _ip(ip), _port(port), _x(0), _y(0) {
}

std::string client::getIp() {
    return this->_ip;
}

int client::getPort() {
    return this->_port;
}

client::~client() {
}