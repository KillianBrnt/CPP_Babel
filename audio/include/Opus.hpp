//
// EPITECH PROJECT, 2019
// Babel
// File description:
// Opus lib include
//

#ifndef OPUS_HPP_
#define OPUS_HPP_

#include <opus.h>
#include <iostream>
#include "IEncoder.hpp"
#include "Sound.hpp"

class Opus: public IEncoder
{
public:
    Opus();
    Opus(int bitrate);
    ~Opus();
    Sound::Decoded decode(const Sound::Encoded &sound);
    Sound::Encoded encode(const Sound::Decoded &sound);
private:
    void createEncoder();
    void createDecoder();
    OpusEncoder *_encoder;
    OpusDecoder *_decoder;
    int _application;
    int _bitrate;
};

#endif /* OPUS_HPP_ */
