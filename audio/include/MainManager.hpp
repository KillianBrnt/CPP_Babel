#ifndef MAINMANAGER_HPP
#define MAINMANAGER_HPP

#include <iostream>
#include "AudioManager.hpp"
#include "Sound.hpp"

class MainManager{
public:
	MainManager(const int port);
	~MainManager();
	void startCall(void);
	void stopCall(void);
	bool isInCommunication(void) const;

private:
	bool _inCommunication;
	AudioManager _audioManager;
};

#endif