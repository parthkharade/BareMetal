CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -mthumb -c -mcpu=$(MACH) -std=gnu11

all: main.o led.o

main.o:main.c
	$(CC) $(CFLAGS)  main.c -o main.o

led.o:led.c
	$(CC) $(CFLAGS) -o $@ $^ 