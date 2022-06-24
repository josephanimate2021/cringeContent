echo Installing some dependicies....
sudo apt install --no-install-recommends ca-certificates qtbase5-dev qtbase5-private-dev git cmake make gcc g++ pkg-config libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libxi-dev libxrandr-dev libudev-dev libevdev-dev libsfml-dev libminiupnpc-dev libmbedtls-dev libcurl4-openssl-dev libhidapi-dev libsystemd-dev libbluetooth-dev libasound2-dev libpulse-dev libpugixml-dev libbz2-dev libzstd-dev liblzo2-dev libpng-dev libusb-1.0-0-dev gettext
echo Installing git....
sudo apt install git
echo Cloning the repo.....
git clone https://github.com/dolphin-emu/dolphin.git dolphin-emu
echo Peforming some updates....
cd ./dolphin-emu
git submodule update --init
git pull origin
git checkout tags/5.0
echo Bulding the repo....
mkdir Build && cd Build
cmake ..
make -j$(nproc)
sudo make install
cmake -Dbindir=../Binary/Linux -Ddatadir=../Binary/Linux ..
echo "Enjoy!"
dolphin-emu
