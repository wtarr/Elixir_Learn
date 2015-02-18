defmodule ArduinoSerialLightOnOff do
  # based on https://github.com/knewter/arduino_motor_driver
  # see for connecting via virtual box http://joequery.me/guides/arduino-ubuntu-virtualbox-windows-host/

  def start() do
    :serial.start([speed: 9600, open: :erlang.bitstring_to_list("/dev/ttyS0")])
  end

  def turnLedOn(dev) do
    command(dev, "on")
  end

  def turnLedOff(dev) do
    command(dev, "off")
  end

  def command(dev, msg) do
    send(dev, {:send, msg})
  end

end
