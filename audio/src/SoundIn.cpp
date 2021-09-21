//
// EPITECH PROJECT, 2019
// 
// File description:
// 
//

#include <iostream>
#include "../include/SoundIn.hpp"

SoundIn::SoundIn() : mListener(NULL), _stream(NULL), _running(false)
{
    if (Pa_Initialize() != paNoError)
	std::cerr << "ERROR INITIALIZE PA" << std::endl;
    this->initInput();
}

SoundIn::~SoundIn()
{
    stop();
    Pa_Terminate();
}

void SoundIn::initInput()
{
    this->_running = false;
    this->_params.device = Pa_GetDefaultInputDevice();
    this->_params.channelCount = Sound::NB_CHANNELS;
    this->_params.sampleFormat = paFloat32;
    this->_params.hostApiSpecificStreamInfo = NULL;
    this->_params.suggestedLatency = Pa_GetDeviceInfo(_params.device)->defaultLowInputLatency;
}

void SoundIn::start()
{
    if (this->_running == false) {
	if (Pa_OpenStream(&this->_stream, &this->_params, NULL, Sound::SAMPLE_RATE, Sound::FRAMES, paClipOff, SoundIn::StreamCallback, this) != paNoError)
	    	std::cerr << "ERROR IN PA OPENSTREAM ERROR" << std::endl;
	if (Pa_StartStream(this->_stream) != paNoError)
	    std::cerr << "ERROR PA IN STARTSTREAM ERROR" << std::endl;
	this->_running = true;
    }
}

void SoundIn::stop()
{
    if (this->_running == true) {
	if (Pa_CloseStream(this->_stream) != paNoError)
	    std::cerr << "ERROR PA IN CLOSE STREAM ERROR" << std::endl;
	this->_running = false;
    }
}

int SoundIn::StreamCallback(const void *input, void *output, unsigned long frameCount, const PaStreamCallbackTimeInfo *timeInfo, PaStreamCallbackFlags statusFlags, void *userData)
{
    SoundIn *obj = reinterpret_cast<SoundIn *>(userData);

	Sound::Decoded sound;
	sound.size = frameCount * Sound::NB_CHANNELS;
	sound.buffer.assign(reinterpret_cast<const float *>(input), reinterpret_cast<const float *>(input) + frameCount * Sound::NB_CHANNELS);

	obj->_buffer.push_back(sound);

	if (obj->mListener)
		obj->mListener->onSoundAvailable(obj);
	return paContinue;
}

ISoundHand &SoundIn::operator<<(const Sound::Decoded &sound)
{
    return (*this);
}

ISoundHand &SoundIn::operator>>(Sound::Decoded &sound)
{
    if (_buffer.size()) {
		Sound::Decoded soundCpy = _buffer.front();

		sound.buffer = soundCpy.buffer;
		sound.size = soundCpy.size;

		_buffer.pop_front();
	}
	else
		sound.size = 0;
    return (*this);
}

void	SoundIn::setOnSoundDeviceEventListener(ISoundHand::OnSoundDeviceEvent *listener) {
    mListener = listener;
}