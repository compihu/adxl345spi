CC = gcc
CFLAGS = -Wall -pthread
LIBS = -L /usr/local/include -lpigpio -lrt
INSTALL = `which install`

all: packages adxl345spi

install: adxl345spi
	$(INSTALL) ./adxl345spi /usr/local/bin/adxl345spi

clean:
	rm -f adxl345spi

packages:
	@if ! which pigpiod >/dev/null 2>&1; then echo "pigpio package cannot be found!"; false; fi

adxl345spi: adxl345spi.c
	$(CC) $(CFLAGS) adxl345spi.c $(LIBS) -o adxl345spi
