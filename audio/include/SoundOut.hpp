//
// EPITECH PROJECT, 2019
//
// File description:
//
//

#ifndef SOUNDOUT_HPP
# define SOUNDOUT_HPP

#include <list>
#include <iostream>
#include "ISoundHand.hpp"

class SoundOut : public ISoundHand
{
public:
	SoundOut(void);
	~SoundOut(void);
	SoundOut(const SoundOut &) {}
	const SoundOut &operator=(const SoundOut &) { return *this; }
	void start(void);
	void stop(void);
	ISoundHand &operator<<(const Sound::Decoded &soundBuffer);
	ISoundHand &operator>>(Sound::Decoded &soundBuffer);
	static int StreamCallback(const void *inputBuffer, void *outputBuffer, unsigned long framesPerBuffer, const PaStreamCallbackTimeInfo *timeInfo, PaStreamCallbackFlags statusFlags, void *userData);
	void setOnSoundDeviceEventListener(ISoundHand::OnSoundDeviceEvent *) {}

private:
	void initOutput(void);
	std::list<Sound::Decoded> _buffer;
	PaStreamParameters _params;
	PaStream *_stream;
	bool _running;
};

#endif
