/*
** EPITECH PROJECT, 2019
** Babel
** File description:
** Encoder Interface
*/

#ifndef IENCODER_HPP_
#define IENCODER_HPP_

#include "Sound.hpp"

class IEncoder
{
public:
    virtual ~IEncoder(){};
    virtual Sound::Encoded encode(const Sound::Decoded &sound) = 0;
    virtual Sound::Decoded decode(const Sound::Encoded &sound) = 0;
};

#endif /* OPUS_HPP_ */
