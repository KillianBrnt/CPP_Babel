//
// EPITECH PROJECT, 2019
// 
// File description:
// 
//

#ifndef SOUNDNAME_HPP
# define SOUNDNAME_HPP

#include <vector>

namespace Sound {
    const int SAMPLE_RATE = 48000;
    const int NB_CHANNELS = 2;
    const int FRAMES = 480;

    struct Encoded {
        std::vector<unsigned char> buffer;
        int size;
    };

    struct Decoded {
        std::vector<float> buffer;
        int size;
    };
}

#endif
