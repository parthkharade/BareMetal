/*
The linker scripts have various "Commands" which allow it
to carry out operations of linking and locating
*/


/*the ENTRY command sets the entry point for the linker script 
which in our case is the reset Handler*/
ENTRY(Reset_Handler)

/*
The memory command is used to place 
different sections in different parts of the memory
MEMORY
{
    name(attr): ORIGIN =, LENGTH = len
}
    { LABEL  }  {ORIGIN}    {LENGTH}
    The Label defins the name of the memory section 
    which will be later referenced by the script

    attr options

    R   : Read-only sections
    W   : Read and write sections
    X   : Sections containing executable code
    A   : Allocated Sections
    I   : Initialised Sections
    L   : Same as I
    !   : Invert the sense of the attribute

Our microcontroller has three memory regions
FLASH
SRAM1
SRAM2
We proivde the boundaries for them here
IN our code we club the SRAM1 and SRAM2 into SRAM
*/
MEMORY
{
    FLASH(rx) : ORIGIN = 0x08000000,LENGTH = 1024K
    SRAM(rxw) : ORIGIN = 0x20000000,LENGTH = 128K  
}
/*
SECTIONS command

Create sections by merging sections of different files in
the final executable created by merging input sections to
create an output section.

Can place the output sections in specefic memories.

Basically take similar sections from different output files
and create a single output section.
Then this output section can be placed in the memory segments 
we have defined earlier.

*/

SECTIONS
{
    /*This section should include .text section of all input files*/
    .text :
    {
        /* ISR section from startup.o */
        *(.isr_vector)
        /* .text of main.o led.o startup.o */
        *(.text) 
        /* .rodata section from all files */
        *(.rodata)
        . = ALIGN(4); 
        /*Word align the end of this section and update location counter*/
         _etext = .; /*Store the location counter symbol value.*/
    }>FLASH
    /* >Vma AT> lma */
    /* This section goes to the flash and is not present on the RAM
    Hence VMA and LMA are the same */

    .data :
    {
        _sdata = .;
        start_of_data = 0x20000000;
        *(.data)
        . = ALIGN(4);
        _edata = .;
    }>SRAM AT>FLASH
    /* Mention that Vma is SRAM and LMA is at flash */

    .bss :
    {
        _sbss = .;
        *(.bss)
        *(COMMON)
        /* The compiler places some intialised global data in the common 
        section. We inlcude the common section here so that the data
        makes it to the .bss section */
        . = ALIGN(4);
        _ebss = .;
    }>SRAM

    /* Location Counter : A symbol to keep track of section boundaries 
        Should only be used in the SECTION Command
        
        Special Linker symbol denoted by "."
        Incremented by the size of the location counter.

        You can declare linker script symbols 
        */
}

