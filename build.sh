
rm -rf build

cd nginx-1.8.0

./configure --prefix=../build --with-zlib=../zlib-1.2.11 --with-pcre=../pcre-8.38 --with-debug

make

make install

cd ../build

mkdir build

mv conf/ build/
mv logs/ build/
mv html/ build/

