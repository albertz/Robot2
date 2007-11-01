#!/bin/bash

cp robot.sce robot-backup.sce
rm robot1.7*.zip

# everything
zip -9 robot1.7.zip * -x *.rar backup/ *.zip *.spi \
	*.bak *.sh *.bad *.ppu *.o *.compiled *.png

# only win-exe
zip -9 robot1.7-win-only.zip * -x *.rar backup/ *.zip *.spi \
	*.bak *.sh *.bad *.ppu *.o *.compiled *.png \
	robot robot-ppc

# only linux x86
zip -9 robot1.7-linux-x86-only.zip * -x *.rar backup/ *.zip *.spi \
	*.bak *.sh *.bad *.ppu *.o *.compiled *.png \
	robot.exe robot-ppc

# only linux ppc
zip -9 robot1.7-linux-ppc-only.zip * -x *.rar backup/ *.zip *.spi \
	*.bak *.sh *.bad *.ppu *.o *.compiled *.png \
	robot.exe robot

# source only
zip -9 robot1.7-source-only.zip * -x *.rar backup/ *.zip *.spi \
	*.bak *.sh *.bad *.ppu *.o *.compiled *.png \
	robot robot-ppc robot.exe
