# Cod4 BSP Tool
Call of Duty 4 BSP Tool

Return to Castle Wolfenstein multiplayer GPL Source Code
Copyright (C) 1999-2010 id Software LLC, a ZeniMax Media company. 

This file is part of the Return to Castle Wolfenstein multiplayer GPL Source Code (RTCW MP Source Code).  

RTCW MP Source Code is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

RTCW MP Source Code is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with RTCW MP Source Code.  If not, see [Releases](http://www.gnu.org/licenses/).

In addition, the RTCW MP Source Code is also subject to certain additional terms. You should have received a copy of these additional terms immediately following the terms and conditions of the GNU General Public License which accompanied the RTCW MP Source Code.  If not, please request a copy in writing from id Software at the address below.

If you have questions concerning this license or the applicable additional terms, you may contact in writing id Software LLC, c/o ZeniMax Media Inc., Suite 120, Rockville, Maryland 20850 USA. 

This project is part of the [CoD4x Server](https://github.com/callofduty4x/CoD4x_Server)

BSPC version 2.1c

## Compiling on Windows

To compile CoD4x from source you require the following tools:

- [NASM](http://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D)
- [MinGW](http://www.mingw.org/)

Now compile the tool by running `build_win32_PE.cmd`.

If compilation was successful the binary will be placed in the /bin/ folder. 

## How to use BSP tool

Usage:
- `bspc [-<switch> [-<switch> ...]]`
- **Example 1**: `bspc -bsp2aas d:\\quake3\\baseq3\\maps\\mymap?.bsp`  
- **Example 2**: `bspc -bsp2aas d:\\quake3\\baseq3\\pak0.pk3\\maps/q3dm*.bsp`

Switches: 
- `bsp2map            <[pakfilter/]filter.bsp>`&emsp;&emsp;&emsp;&emsp;convert BSP or FF to MAP
- `bsp2aas            <[pakfilter/]filter.bsp>`&emsp;&emsp;&emsp;&emsp;convert BSP to AAS
- `reach              <filter.bsp>`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;compute reachability & clusters
- `cluster            <filter.aas>`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;compute clusters
- `aasopt             <filter.aas>`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;optimize aas file
- `output             <output path>`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;set output path
- `threads            <X>`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;set number of threads to X
- `cfg                <filename>`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;use this cfg file
- `optimize`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;enable optimization
- `noverbose`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;disable verbose output
- `breadthfirst`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;breadth first bsp building
- `nobrushmerge`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;don't merge brushes
- `noliquids`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;don't write liquids to map
- `freetree`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;free the bsp tree
- `nocsg`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;disables brush chopping
- `forcesidesvisible`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;force all sides to be visible
- `grapplereach`&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;calculate grapple reachabilities
