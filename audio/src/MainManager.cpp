#include "../include/MainManager.hpp"

MainManager::MainManager(const int port) : _inCommunication(false), _audioManager(port) {
}

MainManager::~MainManager() {
}

void	MainManager::startCall() {
	_inCommunication = true;

	_audioManager.startRecording();
	_audioManager.startPlaying();
	while (1) {
		_audioManager.playSound();
	}
}

void	MainManager::stopCall(void) {
	_inCommunication = false;

	_audioManager.stopRecording();
	_audioManager.stopPlaying();
}

bool	MainManager::isInCommunication(void) const {
	return _inCommunication;
}