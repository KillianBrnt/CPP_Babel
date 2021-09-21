//
// EPITECH PROJECT, 2019
// 
// File description:
// 
//

#ifndef ISOUNDHAND_HPP
#define ISOUNDHAND_HPP

#include <portaudio.h>
#include "Sound.hpp"

class ISoundHand
{
public:
	class OnSoundDeviceEvent {
		public:
			virtual void	onSoundAvailable(ISoundHand *soundDevice) = 0;
	};
	virtual ~ISoundHand(void) {}
	virtual void start(void) = 0;
	virtual void stop(void) = 0;
	virtual ISoundHand &operator<<(const Sound::Decoded &soundBuffer) = 0;
	virtual ISoundHand &operator>>(Sound::Decoded &soundBuffer) = 0;
	virtual void setOnSoundDeviceEventListener(ISoundHand::OnSoundDeviceEvent *listener) = 0;
};

#endif
