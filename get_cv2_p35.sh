cd ~
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.1.0

cd ~
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib
git checkout 3.1.0

cd ~/opencv
rm -r build
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=~/local/ \
    -D WITH_CUDA=ON \
    -D ENABLE_FAST_MATH=1 \
    -D CUDA_FAST_MATH=1 \
    -D WITH_CUBLAS=1 \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-7.5 \
    -D PYTHON_DEFAULT_EXECUTABLE=$HOME/local/bin/python3.5 \
    -D PYTHON_INCLUDE_DIRS=$HOME/local/include/python3.5m \
    -D PYTHON_EXECUTABLE=$HOME/local/bin/python3.5 \
    -D PYTHON_LIBRARY=$HOME/local/lib/libpython3.5m.so.1.0 \
    -D BUILD_opencv_ts=0 ..
make -j8

sudo make install
sudo ldconfig
