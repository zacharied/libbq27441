# libbq27441

This is a userspace I2C/SMBus driver for the Texas Instruments [BQ27441](http://www.ti.com/product/BQ27441-G1) series 
of battery fuel gauge monitor microcontrollers. It is found in the 
[SparkFun Battery Babysitter](https://www.sparkfun.com/products/13777), an IC that performs power path management for
a connected LiPo battery.

## Installation

With the I2C headers and libraries installed on your machine, simply run `make`. Then, run `make install` as root to
copy the headers and shared objects to their directories in `/usr/local`.

## Usage

To use this library, your first need to know the I2C bus occupied by your BQ2x. This will typically be the number
`x` in the file `dev/i2c-x`.

After installation, include the header in any C file with `#include <bq27441.h>`. Then, call `bq27441_init` with
the bus number mentioned earlier to initialize the driver. `bq27441_init` will return 1 if an error occurs during
setup, otherwise it will return 0 and you may call any of the `bq27441` functions to get the associated data from
the device.

## References

* [SLUUAC9A: BQ27441-G1 Technical Reference Manual](http://www.ti.com/lit/ug/sluuac9a/sluuac9a.pdf)
* [SLUSBH1C: BQ27441-G1 Datasheet](https://cdn.sparkfun.com/datasheets/Prototyping/bq27441-g1.pdf)
