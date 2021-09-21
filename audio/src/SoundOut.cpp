//
// EPITECH PROJECT, 2019
// 
// File description:
// 
//

#include <iostream>
#include "../include/SoundOut.hpp"

SoundOut::SoundOut() : _running(false), _stream(NULL)
{
    if (Pa_Initialize() != paNoError)
        std::cout << "ERROR" << std::endl;
    this->initOutput();
}

SoundOut::~SoundOut()
{
    stop();
    Pa_Terminate();
}


void SoundOut::initOutput()
{
    this->_params.device = Pa_GetDefaultOutputDevice();
    if (this->_params.device == paNoDevice)
 	std::cout << "NO DEVICE FOUND PA OUT" << std::endl;
    this->_params.channelCount = Sound::NB_CHANNELS;
    this->_params.sampleFormat = paFloat32;
    this->_params.suggestedLatency = Pa_GetDeviceInfo(_params.device)->defaultLowOutputLatency;
    this->_params.hostApiSpecificStreamInfo = NULL;
}

void SoundOut::start()
{
    if (this->_running == false) {
	    if (Pa_OpenStream(&this->_stream, NULL, &this->_params, Sound::SAMPLE_RATE, Sound::FRAMES, paClipOff, SoundOut::StreamCallback, this) != paNoError)
	        std::cout << "ERROR PA OUT OPENSTREAM ERROR" << std::endl;
	    if (Pa_StartStream(_stream) != paNoError)
	        std::cout << "ERROR PA OUT STARTSTREAM ERROR" << std::endl;
	    this->_running = true;
    }
}

void SoundOut::stop()
{
    if (this->_running == true) {
	if (Pa_CloseStream(this->_stream) != paNoError)
            std::cerr << "ERROR PA OUT CLOSESTREAM ERROR" << std::endl;
        this->_running = false;
    }
}

int SoundOut::StreamCallback(const void *input, void *output, unsigned long frameCount, const PaStreamCallbackTimeInfo *timeInfo, PaStreamCallbackFlags statusFlags, void *userData)
{
    SoundOut *obj = reinterpret_cast<SoundOut *>(userData);

	if (obj->_buffer.size() == 0)
		return paContinue;

	Sound::Decoded sound = obj->_buffer.front();
	float *wptr = static_cast<float *>(output);

	for (int i = 0; i < sound.size; i++)
		*wptr++ = sound.buffer[i];

	obj->_buffer.pop_front();

	return paContinue;
}

ISoundHand &SoundOut::operator<<(const Sound::Decoded &sound)
{
    Sound::Decoded soundCpy;

    if (sound.size) {
	    soundCpy.buffer = sound.buffer;
	    soundCpy.size = sound.size;
	    this->_buffer.push_back(soundCpy);
    }
    return (*this);
}

ISoundHand &SoundOut::operator>>(Sound::Decoded &sound)
{
    return (*this);
}
