OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")

MEMORY
{
    FLASH (rx)    : ORIGIN = 0x08000000, LENGTH = 20K
    RAM (rxw)     : ORIGIN = 0x20000000, LENGTH = 3K
}

PROVIDE(__stack_top = ALIGN(ORIGIN(RAM) + LENGTH(RAM) - 8 ,8));

SECTIONS {

    .isr_vector : {
        LONG(__stack_top);
        KEEP(*(.isr_vector))
        . = ALIGN(4);
    } > FLASH

    .text : {
        *(.text*)
        *(.srodata*)
        *(.rodata*)
    } > FLASH

    .ARM.extab : {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > FLASH

    .ARM.exidx : {
        *(.ARM.exidx*)
        . = ALIGN(4);
    } > FLASH

    __text_end = .;

    .data : {
        __data_start = .;
        *(SORT_BY_ALIGNMENT(.data*))
        . = ALIGN(4);
    } > RAM AT> FLASH
    __data_size = SIZEOF(.data);

    __data_end = .;

    .bss (NOLOAD) : {
        __bss_start = .;
        . = ALIGN(4);
        *(.sbss*)
        *(.bss*)
    } > RAM
    __bss_size = SIZEOF(.bss);

    
    /* DWARF 4 
    .debug_abbrev 0 : { *(.debug_abbrev) }
    .debug_aranges 0 : { *(.debug_aranges) }
    .debug_frame 0 : { *(.debug_frame) }
    .debug_info 0 : { *(.debug_info) }
    .debug_line 0 : { *(.debug_line) }
    .debug_loc 0 : { *(.debug_loc) }
    .debug_macinfo 0 : { *(.debug_macinfo) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    .debug_pubtypes 0 : { *(.debug_pubtypes) }
    .debug_ranges 0 : { *(.debug_ranges) }
    .debug_str 0 : { *(.debug_str) }
    .debug_types 0 : { *(.debug_types) }
    */
}
