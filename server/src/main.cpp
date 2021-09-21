/*
** EPITECH PROJECT, 2019
** r type
** File description:
** main
*/

#include <memory>
#include <iostream>
#include <string>
#include "../include/udp_server.hpp"

int main(int ac, char **av)
{
    if (ac < 2)
        return (0);
    try {
        std::unique_ptr<udp_server>	server = std::make_unique<udp_server> (atoi(av[1]));
        server->run();
	    return 0;
    }
    catch (std::exception& e)
    {
        std::cerr << e.what() << std::endl;
        return -1;
    }
    return 0;
}
