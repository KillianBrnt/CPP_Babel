//
// EPITECH PROJECT, 2019
// 
// File description:
// 
//

#ifndef SOUNDIN_HPP
# define SOUNDIN_HPP

#include <list>
#include <iostream>
#include "ISoundHand.hpp"

class SoundIn : public ISoundHand
{
public:
	SoundIn(void);
	~SoundIn(void);
	SoundIn(const SoundIn &) {}
	const SoundIn &operator=(const SoundIn &) { return *this; }
	void start(void);
	void stop(void);
	ISoundHand &operator<<(const Sound::Decoded &soundBuffer);
	ISoundHand &operator>>(Sound::Decoded &soundBuffer);
	static int StreamCallback(const void *inputBuffer, void *outputBuffer, unsigned long framesPerBuffer, const PaStreamCallbackTimeInfo *timeInfo, PaStreamCallbackFlags statusFlags, void *userData);
	void setOnSoundDeviceEventListener(ISoundHand::OnSoundDeviceEvent *listener);

private:
    void initInput(void);
	std::list<Sound::Decoded> _buffer;
	PaStreamParameters _params;
	PaStream *_stream;
	bool _running;
	ISoundHand::OnSoundDeviceEvent *mListener;
};

#endif
