OUTPUT_ARCH( "riscv" )

ENTRY( _start )

MEMORY
{
  ram   (wxa!ri) : ORIGIN = 0x80000000, LENGTH = 128M
}
MEMORY
{
  TEXT (rx) : ORIGIN = 0x80000000, LENGTH = 0x00100000
  DATA (rw) : ORIGIN = 0x81000000, LENGTH = 0x10000
}

PHDRS
{
  text PT_LOAD;
  data PT_LOAD;
  rodata PT_LOAD;
  bss PT_LOAD;
}

SECTIONS
{
  . = 0x80000000;
  .text : {
    PROVIDE(_text._start = .);
    *(.text .text.*) 
    PROVIDE(_text._end = .);
  } > TEXT : text

  . = 0x81000000;
  .data : {
    PROVIDE(_data_start = .);
    *(.data .data.*)
    PROVIDE(_data_end = .);
  } > TEXT : data

  .rodata : {
    PROVIDE(_rodata_start = .);
    *(.rodata .rodata.*)
    PROVIDE(_rodata_end = .);
  } > TEXT : rodata


  PROVIDE(_memory_start = ORIGIN(ram));
  PROVIDE(_memory_end = ORIGIN(ram) + LENGTH(ram));
}
