cd ~/local/src/
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.3.0

cd ..
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib
git checkout 3.3.0

cd ~/local/src/opencv

rm -r build
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=~/local/ \
    -D ENABLE_FAST_MATH=1 \
    -D OPENCV_EXTRA_MODULES_PATH=~/local/src/opencv_contrib/modules \
    -D PYTHON_DEFAULT_EXECUTABLE=$HOME/local/bin/python3.5 \
    -D PYTHON_INCLUDE_DIRS=$HOME/local/include/python3.5m \
    -D PYTHON_EXECUTABLE=$HOME/local/bin/python3.5 \
    -D PYTHON_LIBRARY=$HOME/local/lib/libpython3.5m.so.1.0 \
    -D BUILD_opencv_ts=0 ..
make -j8

make install
sudo ldconfig
