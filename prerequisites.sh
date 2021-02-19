set -e
PKG_DIR=`dirname "$0"`
cd $PKG_DIR/extern/nauty2*r* && ./configure CFLAGS="-fPIC -O4" && make nauty.a
