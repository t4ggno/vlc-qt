@echo off

SETLOCAL

SET BUILD_TYPE=%1

SET MSVC_COMPILER="C:/Program Files (x86)/Microsoft Visual Studio 14.0/VC/vcvarsall.bat"

SET DLIBVLC_LIBRARY_X64="../../../_VLC_SDK/X64/sdk/lib/libvlc.lib"
SET DLIBVLCCORE_LIBRARY_X64="../../../_VLC_SDK/X64/sdk/lib/libvlccore.lib"
SET DLIBVLC_INCLUDE_DIR_X64="../../../_VLC_SDK/X64/sdk/include"

SET DLIBVLC_LIBRARY_X86="../../../_VLC_SDK/X86/sdk/lib/libvlc.lib"
SET DLIBVLCCORE_LIBRARY_X86="../../../_VLC_SDK/X86/sdk/lib/libvlccore.lib"
SET DLIBVLC_INCLUDE_DIR_X86="../../../_VLC_SDK/X86/sdk/include"


::======================================================
::== X64 BUILD
::======================================================

IF "%BUILD_TYPE%" == "X64" (

	CALL %MSVC_COMPILER% amd64

	IF NOT EXIST "./build/X64" MKDIR "./build/X64"
	CD "./build/X64"

	IF NOT EXIST "./debug" MKDIR "./debug"
	CD debug
	cmake -G "NMake Makefiles" ../../.. -DCMAKE_INSTALL_PREFIX="./INSTALL" -DCMAKE_BUILD_TYPE=Debug -DLIBVLC_LIBRARY=%DLIBVLC_LIBRARY_X64% -DLIBVLCCORE_LIBRARY=%DLIBVLCCORE_LIBRARY_X64% -DLIBVLC_INCLUDE_DIR=%DLIBVLC_INCLUDE_DIR_X64%
	nmake
	nmake install
	CD ..

	IF NOT EXIST "./release" MKDIR "./release"
	CD release
	cmake -G "NMake Makefiles" ../../.. -DCMAKE_INSTALL_PREFIX=./INSTALL -DCMAKE_BUILD_TYPE=Release -DLIBVLC_LIBRARY=%DLIBVLC_LIBRARY_X64% -DLIBVLCCORE_LIBRARY=%DLIBVLCCORE_LIBRARY_X64% -DLIBVLC_INCLUDE_DIR=%DLIBVLC_INCLUDE_DIR_X64%
	nmake
	nmake install
	CD ..
)

::======================================================
::== X86 BUILD
::======================================================

IF "%BUILD_TYPE%" == "X86" (

	CALL %MSVC_COMPILER%

	IF NOT EXIST "./build/X86" MKDIR "./build/X86"
	cd "./build/X86"

	IF NOT EXIST "./debug" MKDIR "./debug"
	CD debug
	cmake -G "NMake Makefiles" ../../.. -DCMAKE_INSTALL_PREFIX=./INSTALL -DCMAKE_BUILD_TYPE=Debug -DLIBVLC_LIBRARY=%DLIBVLC_LIBRARY_X64% -DLIBVLCCORE_LIBRARY=%DLIBVLCCORE_LIBRARY_X64% -DLIBVLC_INCLUDE_DIR=%DLIBVLC_INCLUDE_DIR_X64%
	nmake
	nmake install
	CD ..

	IF NOT EXIST "./release" MKDIR "./release"
	CD release
	cmake -G "NMake Makefiles" ../../.. -DCMAKE_INSTALL_PREFIX=./INSTALL -DCMAKE_BUILD_TYPE=Release -DLIBVLC_LIBRARY=%DLIBVLC_LIBRARY_X64% -DLIBVLCCORE_LIBRARY=%DLIBVLCCORE_LIBRARY_X64% -DLIBVLC_INCLUDE_DIR=%DLIBVLC_INCLUDE_DIR_X64%
	nmake
	nmake install
	CD ..
)

::======================================================
::== Exit
::======================================================

:EXIT