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


*/

SECTIONS
{
    /*This section should include .text section of all input files*/
    
}