TOOLHOME = /opt/riscv-elf/bin
#DEBUG_FLAGS = -DDEBUG
DEBUG_FLAGS = 
CFLAGS = -fPIC 
all: monitor
#monitor1 monitor2 hello test datagen myprintx86 monitor_mainx86 # hello32

monitor: monitor.o ascii_tbl.s hw_info.s tasklet_config.s
	$(TOOLHOME)/riscv64-unknown-elf-ld -T linkn0.lds -o monitor monitor.o 
	$(TOOLHOME)/riscv64-unknown-elf-objcopy --gap-fill=0x00 -O binary monitor monitor.bin
	$(TOOLHOME)/riscv64-unknown-elf-objdump -D monitor > monitor.dis

monitor.o: monitor.s ascii_tbl.s hw_info.s tasklet_config.s
	$(TOOLHOME)/riscv64-unknown-elf-as -o monitor.o monitor.s

clean:
	rm *.o *.dis *.bin 
