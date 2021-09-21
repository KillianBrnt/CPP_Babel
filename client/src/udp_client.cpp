#include "../include/udp_client.hpp"

udp_client::udp_client(const int port) : _socket(std::make_unique<udp_socket>("127.0.0.1", port))
{
}

udp_client::~udp_client() {

}

void udp_client::sendSound(const Sound::Encoded &sound) {
    udp_client::SoundPacket soundPacket;

	soundPacket.magic_code = 0x150407CA;
	soundPacket.soundSize = sound.size;
	std::memset(soundPacket.sound, 0, sizeof(soundPacket.sound));
	memcpy(soundPacket.sound, sound.buffer.data(), sound.size);

    udp_socket::Datagram msg;

	msg._data.assign(reinterpret_cast<char *>(&soundPacket), reinterpret_cast<char *>(&soundPacket + 1));
	msg._lenght = sizeof(soundPacket);
	msg._ip = _socket->getIp();
	msg._port = _socket->getPort();

    _socket->writeSocket(msg);
}

Sound::Encoded udp_client::onReceiveSound() {
    udp_socket::Datagram msg;
	udp_client::SoundPacket soundPacket;
	Sound::Encoded sound;
	Sound::Encoded empty;

    msg = _socket->readSocket();
    memcpy(&soundPacket, msg._data.data(), msg._lenght);
    if (soundPacket.magic_code == 0x150407CA) {
		sound.buffer.assign(soundPacket.sound, soundPacket.sound + sizeof(soundPacket.sound));
		sound.size = soundPacket.soundSize;
		return (sound);
	}
	empty.size = 0;
	return (empty);
}

void udp_client::connect(std::string string) {
    udp_socket::Datagram msg;

	msg._data = std::vector<char> (string.begin(), string.end());
	msg._lenght = strlen(string.c_str());
	msg._ip = _socket->getIp();
	msg._port = _socket->getPort();

    _socket->writeSocket(msg);
}