@echo off
set color=0a
color %color%

:START
cls
echo. ===========================================================================
echo. 
echo.  Name:			BSP tool
echo.  Function:
echo.  Programmer:		id Software ^& Mr Elusive (MrElusive@demigod.demon.nl)
echo.  Last update:		1997-12-04
echo.  Tab Size:		3
echo.  Notes:		Microsoft Visual C++ optimizations:
echo. 					"global optimization" or "full optimization" results
echo. 					in micro brushes??
echo. ===========================================================================

:MAKEOPTIONS
echo _________________________________________________________________
echo.
echo  Please select an option:
echo    1. Build BSP tool.
echo    2. Cleanup directories, build BSP tool.
echo    0. Exit.
echo.
set /p make_option=:
set make_option=%make_option:~0,1%
if "%make_option%"=="1" goto BUILD
if "%make_option%"=="2" goto CLEANUP
if "%make_option%"=="0" goto FINAL
goto START

:CLEANUP
set obj_dir=obj
set bin_dir=bin\bspc.exe
set file_count=0

for %%f in (%obj_dir%\*.o) do (
    set /a file_count+=1
)

if %file_count% GTR 0 (
    echo Cleaning up obj's...
    del obj\*.o
)

if exist %bin_dir% (
    echo Cleaning up bspc.exe...
    del %bin_dir%
)

:BUILD

echo Compiling C-code...
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/aas_map.c -o obj\aas_map.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_bsp_iw3.c -o obj\l_bsp_iw3.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/map_iw3.c -o obj\map_iw3.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_bsp_q3.c -o obj\l_bsp_q3.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/map_q3.c -o obj\map_q3.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/map.c -o obj\map.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/cm_patch.c -o obj\cm_patch.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/zlib/inflate.c -o obj\inflate.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/zlib/adler32.c -o obj\adler32.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/zlib/crc32.c -o obj\crc32.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/zlib/inffast.c -o obj\inffast.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/zlib/inftrees.c -o obj\inftrees.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/zlib/cod4x_utils.c -o obj\cod4x_utils.o

g++ -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/mem_track.cpp -o obj\mem_track.o
g++ -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/physicalmemory.cpp -o obj\physicalmemory.o
g++ -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/com_pack.cpp -o obj\com_pack.o
g++ -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/db_miniregistry.cpp -o obj\db_miniregistry.o
g++ -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/db_miniload.cpp -o obj\db_miniload.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/bspc.c -o obj\bspc.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_log.c -o obj\l_log.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_cmd.c -o obj\l_cmd.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_utils.c -o obj\l_utils.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_qfiles.c -o obj\l_qfiles.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_mem.c -o obj\l_mem.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_threads.c -o obj\l_threads.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_poly.c -o obj\l_poly.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_bsp_ent.c -o obj\l_bsp_ent.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_cm.c -o obj\l_cm.o

gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/aas_cfg.c -o obj\aas_cfg.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/l_precomp.c -o obj\l_precomp.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/l_libvar.c -o obj\l_libvar.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/l_struct.c -o obj\l_struct.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/l_script.c -o obj\l_script.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/be_aas_bspq3.c -o obj\be_aas_bspq3.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/be_aas_move.c -o obj\be_aas_move.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/be_aas_sample.c -o obj\be_aas_sample.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/be_aas_cluster.c -o obj\be_aas_cluster.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/be_aas_reach.c -o obj\be_aas_reach.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/be_aas_optimize.c -o obj\be_aas_optimize.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/botlib/be_aas_routealt.c -o obj\be_aas_routealt.o

gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/be_aas_bspc.c -o obj\be_aas_bspc.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/aas_create.c -o obj\aas_create.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/aas_facemerging.c -o obj\aas_facemerging.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/aas_gsubdiv.c -o obj\aas_gsubdiv.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/aas_areamerging.c -o obj\aas_areamerging.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/aas_prunenodes.c -o obj\aas_prunenodes.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/aas_edgemelting.c -o obj\aas_edgemelting.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/aas_store.c -o obj\aas_store.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/aas_file.c -o obj\aas_file.o

gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/tree.c -o obj\tree.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/portals.c -o obj\portals.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/brushbsp.c -o obj\brushbsp.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/nodraw.c -o obj\nodraw.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/glfile.c -o obj\glfile.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -DME -c src/bspc/csg.c -o obj\csg.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/leakfile.c -o obj\leakfile.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/l_assert.c -o obj\l_assert.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/bspc/textures.c -o obj\textures.o

gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/q_math.c -o obj\q_math.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/cm_trace.c -o obj\cm_trace.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/cm_load.c -o obj\cm_load.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/cm_test.c -o obj\cm_test.o
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -march=nocona -D WINVER=0x501 -DBSPC -c src/cmodel.c -o obj\cmodel.o



nasm -f win32 src/asmsource/_cm_tracebox.asm --prefix _ -o obj\_cm_tracebox.o
nasm -f win32 src/asmsource/_cm_trace.asm --prefix _ -o obj\_cm_trace.o
nasm -f win32 src/asmsource/_cm_mesh.asm --prefix _ -o obj\_cm_mesh.o
nasm -f win32 src/bspc/asmsource/_db_load.asm --prefix _ -o obj\db_load.o
nasm -f win32 src/bspc/asmsource/_db_registry.asm --prefix _ -o obj\db_registry.o
nasm -f win32 src/bspc/asmsource/_db_assetnames.asm --prefix _ -o obj\db_assetnames.o

echo Linking...
gcc -m32 -g -Wl,--nxcompat -o bin/bspc.exe obj\*.o -static-libgcc -static -lstdc++ -lws2_32

REM echo Cleaning up...
REM del *.o

goto FINAL

:FINAL

pause

