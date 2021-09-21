/*
** EPITECH PROJECT, 2019
** r type
** File description:
** main
*/

#include "../../audio/include/MainManager.hpp"

int main(int ac, char **av)
{
    if (ac < 2)
        return (0);
    try {
        MainManager mainManager(atoi(av[1]));
        mainManager.startCall();
        mainManager.stopCall();
	    return 0;
    }
    catch (std::exception& e)
    {
        std::cerr << e.what() << std::endl;
        return -1;
    }
    return 0;
}

