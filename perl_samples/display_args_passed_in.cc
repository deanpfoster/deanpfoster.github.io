// $Id$-*- c++ -*-

#include <iostream>
#include <fstream>

#include <sstream>
#include <getopt.h>


int
main(int argc,char** argv)
{

  for(int i = 0; i < argc; ++i)
    std::cout << i << ":" << argv[i] << "   ";
  std::cout << std::endl;
  std::cout << std::endl;
  std::cout << std::endl;

  for(int i = 0; i < argc; ++i)
    std::cout << argv[i] << "";
  std::cout << std::endl;
  std::cout << std::endl;
  std::cout << std::endl;
  return(0);
};

