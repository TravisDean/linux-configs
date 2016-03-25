  929  ./configure --prefix=$pre EXIV2_LIBS=-L$HOME/travis/devout/lib/ PKG_CONFIG_PATH=/home/travis/devout/lib/pkgconfig/:$PKG_CONFIG_PATH
  931  make clean
  932  make
  935  make install
