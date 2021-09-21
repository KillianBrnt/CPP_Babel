/*
** EPITECH PROJECT, 2019
** Babel
** File description:
** load opus
*/

#include "../include/Opus.hpp"

Opus::Opus()
{
    _application = OPUS_APPLICATION_AUDIO;
    _bitrate = 64000;
    createDecoder();
    createEncoder();
}

Opus::~Opus()
{

}

void Opus::createDecoder()
{
    int err;

    _decoder = opus_decoder_create(Sound::SAMPLE_RATE, Sound::NB_CHANNELS, &err);
    if (err < 0)
    {
	throw "Could not create decoder";
    }
}

void Opus::createEncoder()
{
    int err;

    _encoder = opus_encoder_create(Sound::SAMPLE_RATE, Sound::NB_CHANNELS, _application, &err);
    if (err < 0) {
	throw "Could not create encoder";
    }
    err = opus_encoder_ctl(_encoder, OPUS_SET_BITRATE(_bitrate));
    if (err < 0) {
	throw "Could not set bitrate";
    }
}

Sound::Encoded Opus::encode(const Sound::Decoded &sound)
{
    Sound::Encoded encoded;
    
    encoded.buffer.resize(sound.size);
    encoded.size = opus_encode_float(_encoder, sound.buffer.data(), Sound::FRAMES, encoded.buffer.data(), sound.size);
    if (encoded.size < 0)
	std::cerr << "ERROR OPUS" << std::endl;
    return (encoded);
}

Sound::Decoded Opus::decode(const Sound::Encoded &sound)
{
    Sound::Decoded decoded;
    
    decoded.buffer.resize(Sound::FRAMES * Sound::NB_CHANNELS);
    decoded.size = opus_decode_float(_decoder, sound.buffer.data(), sound.size, decoded.buffer.data(), Sound::FRAMES, 0) * Sound::NB_CHANNELS;
    if (decoded.size < 0)
	std::cerr << "ERROR OPUS" << std::endl;
    return (decoded);
}
