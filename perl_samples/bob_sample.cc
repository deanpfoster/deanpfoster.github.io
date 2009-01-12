// $Id: bob_sample.cc 1323 2006-04-05 21:38:25Z foster $-*- c++ -*-

#include <fstream>
#include <iostream>
#include <string>

int
main(int argc,char** argv)
{
  assert(argc == 3);
  std::string in_name  = argv[1];  
  std::cout << "C++ read the input file name as: " << in_name << std::endl;
  std::string out_name  = argv[2];  
  std::cout << "C++ writing to as: " << out_name << std::endl;

  std::ifstream input(in_name.c_str());
  std::ofstream out(out_name.c_str());

  while(input)
    {
      std::string s;
      getline(input,s);
      out << "process line:"  <<s << std::endl;
    }

  std::cout << "\n\nDONE." << std::endl;
  return(0);
};


