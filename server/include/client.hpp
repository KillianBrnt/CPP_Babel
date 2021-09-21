#ifndef CLIENT_HPP
# define CLIENT_HPP

#include <string>

class client
{
private:
    std::string _ip;
    int _port;
    int _x;
    int _y;
public:
    client(const std::string & ip, const int port);
    int getX();
    int getY();
    void addX(const int x);
    void addY(const int y);
    int getPort();
    std::string getIp();
    ~client();
};

#endif