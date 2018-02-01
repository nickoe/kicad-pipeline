# CMake Options
OPTS="$OPTS -DCMAKE_BUILD_TYPE=Debug -DBUILD_GITHUB_PLUGIN=ON -DKICAD_SCRIPTING=ON -DKICAD_SCRIPTING_MODULES=ON -DKICAD_SCRIPTING_WXPYTHON=ON -DKICAD_USE_OCE=OFF -DKICAD_SPICE=OFF"
export TERM=vt220
[ -d build ] || mkdir build
cd build
/usr/bin/cmake .. $OPTS

# make sure the pcbnew python wrapping code is rebuilt by swig
# as we're unable to track all dependencies automatically at this moment.

#rm -f pcbnew/scripting/pcbnewPYTHON_wrap.cxx.o
#rm -f pcbnew/scripting/pcbnewPYTHON_wrap.cxx

#rm -f pcbnew/scripting/pcbnewPYTHON_wrap.cxx.o
rm -f pcbnew/pcbnewPYTHON_wrap.cxx


if env | grep -q ^MAKEJOBS=
then
  echo "Using $MAKEJOBS as jobs option"
  JOBS=$MAKEJOBS
else
  echo "The MAKEJOBS variable is empty"
  JOBS=4
fi

make -j$JOBS
#make qa; RES=$?
export PYTHONPATH=$(pwd)/pcbnew
cd ../qa
/usr/bin/python2 test.py; RES=$?

# if there was an SIGSEV error run with GDB
if [ "0$RES" == "0139" ]; then


  echo "run" > batch
  echo "backtrace" >> batch

  gdb --command batch --batch --args /usr/bin/python2 test.py
fi

exit $RES 

