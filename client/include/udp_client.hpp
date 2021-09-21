#ifndef UDP_CLIENT
# define UDP_CLIENT

#include <iostream>
#include <cstring>
#include <memory>
#include <string>
#include "udp_socket.hpp"
#include "../../audio/include/Sound.hpp"


class udp_client {
    struct SoundPacket {
		int			magic_code;
		int			soundSize;
		char		sound[500];
	};

    private:
        std::unique_ptr<udp_socket>	_socket;
    public:
        udp_client(const int port);
        ~udp_client();
        void connect(std::string string);
        Sound::Encoded onReceiveSound();
        void sendSound(const Sound::Encoded &);
};

#endif