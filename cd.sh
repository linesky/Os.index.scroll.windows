mkdir -p CD_root/isolinux
mkdir -p CD_root/images
mkdir -p CD_root/kernel
cp isolinux.bin CD_root/isolinux/isolinux.bin
cp isolinux.cfg CD_root/isolinux/isolinux.cfg
cp *.bss CD_root/isolinux/
cp *.sys CD_root/isolinux/
cp *.c32 CD_root/isolinux/
cp *.com CD_root/isolinux/
cp *.elf CD_root/isolinux/
cp *.jpg CD_root/isolinux/
cp *.menu CD_root/isolinux/
cp *.txt CD_root/isolinux/
fasm cmd.asm hello.com
fasm beep.asm beep.exe
fasm help.asm help.exe
fasm dir.asm dir.exe
fasm exit.asm exit.exe
fasm cls.asm cls.exe
fasm sleep.asm sleep.exe
fasm time.asm time.exe
fasm date.asm date.exe
fasm clock.asm clock.exe
fasm shutdown.asm shutdown.exe
fasm line.asm line.exe
cp *.com CD_root/isolinux/
cp *.exe CD_root/isolinux/
ls *.exe CD_root/isolinux/ > list.txt
sed -i 's/$/\r/g'  list.txt 
cp list.txt CD_root/isolinux/list.txt
genisoimage -o myos.iso -input-charset utf-8 -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4  -boot-info-table ./CD_root 

