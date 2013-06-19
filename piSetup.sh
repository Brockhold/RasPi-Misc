#!
# Intended for use on Raspian, run with sudo (or root privileges)

# Add needed modules
echo "i2c-bcm2708" >> /etc/modules
echo "i2c-dev" >> /etc/modules

# Update the system software to latest versions of everything
apt-get update
apt-get upgrade

# Install Screen, so headless operation is not terrible.
# Install libraries and tools for operation of the I2C and GPIO from python
apt-get install -y screen python-smbus i2c-tools python-dev python-rpi.gpio

# Add user pi to i2c and serial groups, and never need to use "sudo python test.py" again
usermod -G i2c,dialout pi
