#include "../include/SoundIn.hpp"
#include "../include/SoundOut.hpp"
#include "../include/AudioManager.hpp"

AudioManager::AudioManager(const int port) : _inputDevice(NULL), _outputDevice(NULL), _client(port)
{
	_client.connect(std::string("502"));
	_inputDevice = new SoundIn;
	_inputDevice->setOnSoundDeviceEventListener(this);

	_outputDevice = new SoundOut;
}

AudioManager::~AudioManager() {
	if (_inputDevice)
		delete _inputDevice;

	if (_outputDevice)
		delete _outputDevice;
}

void	AudioManager::playSound() {
	Sound::Encoded sound = _client.onReceiveSound();
	if (sound.size)
		*_outputDevice << _encodeManager.decode(sound);
}

void	AudioManager::startRecording(void) {
	_inputDevice->start();
}

void	AudioManager::onSoundAvailable(ISoundHand * In) {
	Sound::Decoded sound;

	*In >> sound;
	if (sound.size)
		_client.sendSound(_encodeManager.encode(sound));
}
void	AudioManager::stopRecording(void) {
	_inputDevice->stop();
}

void	AudioManager::startPlaying(void) {
	_outputDevice->start();
}

void	AudioManager::stopPlaying(void) {
	_outputDevice->stop();
}