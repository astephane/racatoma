//
// This file is part of racatoma.
//
// racatoma is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// racatoma is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with racatoma.  If not, see
// <https://www.gnu.org/licenses/>.
//

#include <cassert>
#include <cstdlib>
#include <filesystem>
#include <iostream>


#include "config.hpp"


#define unused( x )


std::string basename( char const * );
int usage( char * argv0 );


int
main( int argc, char * argv[] )
{
  if( argc != 2 )
    return usage( argv[ 0 ] );

  return EXIT_SUCCESS;
}


std::string
basename( char const * pathname )
{
  assert( pathname );

  std::filesystem::path p( pathname );

  assert( !p.empty() );

  return p.filename();
}


int
usage( char * argv0 )
{
  std::cout << "Usage: " << basename( argv0 ) << " <filename>"
	    << std::endl;

  std::cout << "  <filename> Players and matches database" << std::endl;

  return EXIT_FAILURE;
}
