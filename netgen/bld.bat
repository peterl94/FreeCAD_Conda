mkdir build -p
cd build 

cmake .. -G "Ninja" ^
      -DCMAKE_PREFIX_PATH=%PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DINSTALL_DIR=%LIBRARY_PREFIX% ^
      -DUSE_OCC=ON ^
      -DUSE_PYTHON=ON ^
      -DUSE_GUI=ON ^
      -DOCC_INCLUDE_DIR=%LIBRARY_PREFIX%/include/opencascade ^
      -DOCC_LIBRARY_DIR=%LIBRARY_PREFIX%/lib ^
      -DPYBIND_INCLUDE_DIRS=%PREFIX%/include/python3.5

if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1

mkdir %LIBRARY_PREFIX%/include/netgen -p

rem rsync -avm --include='*.h*' -f 'hide,! */' .. ${PREFIX}/include/netgen
rem cp ${PREFIX}/include/netgen/build/netgen/config.h ${PREFIX}/include/netgen/mydefs.hpp
rem rm ${PREFIX}/include/netgen/build -r