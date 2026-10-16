OPENMP_PREFIX=$(brew --prefix libomp)
export CFLAGS="$CFLAGS -Xpreprocessor -fopenmp -I$OPENMP_PREFIX/include"
export CXXFLAGS="$CXXFLAGS -Xpreprocessor -fopenmp -I$OPENMP_PREFIX/include"
export LDFLAGS="$LDFLAGS -L$OPENMP_PREFIX/lib -Wl,-rpath,$OPENMP_PREFIX/lib"
export LIBS="$LIBS -lomp"
