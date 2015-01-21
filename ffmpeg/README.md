#FFMPEG for opencv and other softwares
#install from the source

sudo apt-get install yasm

wget http://www.ffmpeg.org/releases/ffmpeg-2.5.tar.gz

tar -xvf ffmpeg-2.5.tar.bz2

cd ffmpeg-2.5/

./configure

make

sudo make install
