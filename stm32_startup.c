#include <stdint.h>

#define SRAM_START  0x20000000U
#define SRAM_SIZE   (128U * 1024U)
#define SRAM_END    ((SRAM_START) + (SRAM_SIZE))
#define STACK_START SRAM_END

void Reset_Handler(void);
//array to store vector addresses
uint32_t vectors[] = {

    STACK_START,
    (uint32_t)&Reset_Handler


};

void Reset_Handler(void)
{

}