brew install openssl libuv cmake
git clone https://github.com/uWebSockets/uWebSockets 
cd uWebSockets
git checkout e94b6e1
patch CMakeLists.txt < ../cmakepatch.txt
mkdir build
export PKG_CONFIG_PATH=/opt/homebrew/Cellar/openssl@1.1/1.1.1k/lib/pkgconfig
cd build
OPENSSL_VERSION=`openssl version -v | cut -d' ' -f2`
cmake -DOPENSSL_ROOT_DIR=$(brew --cellar openssl)/1.1.1k -DOPENSSL_LIBRARIES=$(brew --cellar openssl)/1.1.1k/lib ..
make 
sudo make install
cd ..
cd ..
sudo rm -r uWebSockets