#qemu-system-riscv64 -machine virt -nographic -bios none -kernel test
#qemu-system-riscv64 -machine virt -nographic -bios none -kernel test -S -gdb tcp::1234
qemu-system-riscv64 -machine virt -smp cpus=3 -nographic \
	-kernel monitor.bin -device loader,file=monitor.bin,addr=0x80000000 \
	-bios none 


	
#	-S -gdb tcp::1234  \


#	-d in_asm,cpu -D qemu.log
#qemu-system-riscv64 -machine virt,dumpdtb=qemu-riscv64-virt.dtb -smp cpus=4
