#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential libbsd0 libbsd-dev liblas-dev
rm -f *.o PotreeExtract
# Build source files
g++ -I libs/rapidjson/include/ -I libs/glm/ -I include/ -std=c++11 -Wall -lbsd -c src/pmath.cpp -lstdc++fs
g++ -I libs/rapidjson/include/ -I libs/glm/ -I include/ -std=c++11 -Wall -lbsd -c src/PotreeReader.cpp -lstdc++fs
g++ -I libs/rapidjson/include/ -I libs/glm/ -I include/ -std=c++11 -Wall -lbsd -c src/main_extract_region.cpp -lstdc++fs
g++ -I libs/rapidjson/include/ -I libs/glm/ -I include/ -std=c++11 -Wall -lbsd -c src/main_elevation_profile.cpp -lstdc++fs

# Build PotreeExtract
g++ -std=c++11 -Wall -lbsd -o PotreeExtract main_extract_region.o pmath.o PotreeReader.o -lstdc++fs
# Build PotreeProfile
g++ -std=c++11 -Wall -lbsd -o PotreeExtract main_elevation_profile.o pmath.o PotreeReader.o -lstdc++fs

