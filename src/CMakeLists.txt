##
## This file is part of racatoma.
##
## racatoma is free software: you can redistribute it and/or modify
## it under the terms of the GNU Affero General Public License as
## published by the Free Software Foundation, either version 3 of the
## License, or (at your option) any later version.
##
## racatoma is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Lesser General Public License for more details.
##
## You should have received a copy of the GNU Affero General Public
## License along with racatoma.  If not, see
## <https://www.gnu.org/licenses/>.
##


set( SOURCES
  dummy.cpp
  main.cpp
  template.cpp
  )

add_executable( ${PROJECT_NAME} ${SOURCES} )

message( "CMAKE_SOURCE_DIR=${CMAKE_SOURCE_DIR}" )

target_include_directories( ${PROJECT_NAME}
  PUBLIC ${CMAKE_SOURCE_DIR}/src
  PUBLIC ${CMAKE_BINARY_DIR}
  )

target_link_libraries( ${PROJECT_NAME} -lstdc++fs )

# target_include_directories( ${PROJECT_NAME}
#   PUBLIC ${PROJECT_BINARY_DIR}/src
#   )
