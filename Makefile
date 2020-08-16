CC=arm-none-eabi-gcc						#name of the cross compiler		
MACH=cortex-m4								#mentioning the machine architecture
CFLAGS= -mthumb -c -mcpu=$(MACH) -std=gnu11 -Wall #mentioning the compiler flags -wall turns on the compiler flags

all: main.o led.o stm32_startup.o							#all the output files

main.o:main.c								#recipe for main.o
	$(CC) $(CFLAGS)  main.c -o main.o	

led.o:led.c									#recipe for led.o here   $@ is the target and $^ is the dependency can also be written as $^ -o $@	
	$(CC) $(CFLAGS) -o $@ $^ 

stm32_startup.o:stm32_startup.c
	$(CC) $(CFLAGS)	-o $@ $^

clean: 										#works only in rf environments
	rm -rf *.o *.elf									