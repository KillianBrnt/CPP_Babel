#ifndef AUDIOMANAGER_HPP
# define AUDIOMANAGER_HPP

#include "../../client/include/udp_client.hpp"
#include "ISoundHand.hpp"
#include "Opus.hpp"

class AudioManager : public ISoundHand::OnSoundDeviceEvent {
public:
	AudioManager(const int port);
	~AudioManager();
	void playSound();
	void onSoundAvailable(ISoundHand *soundDevice);
	void startRecording(void);
	void stopRecording(void);
	void startPlaying(void);
	void stopPlaying(void);

private:
	ISoundHand *_inputDevice;
	ISoundHand *_outputDevice;
	Opus _encodeManager;
	udp_client _client;
};

#endif