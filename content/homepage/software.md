---
title: "Software"
weight: 2
header_menu: true
---

The software is divided into two parts: the firmware running on the ESP32 microcontroller and
an image processing script running on a computer.

All the software is open-source and available on the [GitHub repository](https://github.com/SpokeSpice/Software).

##### Image pre-processing

To front-load the real-time processing on the ESP32, the images are pre-processed on a computer
so that all the necessary data is available in a format that can be quickly read by the ESP32.

For that matter, all images are converted to a radial format, where each column of the pixels
prepresents an angle and each row represents the value of each LED pixel in that angle.

For instance, the following image:

![Original image](images/smiley.gif)

Is converted to the following radial image, which is then processed by the ESP32:

![Radial image](images/smiley.rgif)

A python script is used to convert the images to this format. The script is available in the
GitHub repository of the project.

##### Firmware

The firmware is written in C and is based on the [ESP-IDF](https://idf.espressif.com/) framework.

It has the following tasks:

* Receives interrupts from the hall effect sensors on the arms and calculates the speed of the wheel
* Based on the estimated speed, it calculates the position of the wheel
* Read pre-processed radial gifs from the SD card or SPIFFS and displays them on the arms when the wheel is spinning with at least a certain speed
* Diplays patterns on the arms, also when the wheel is not spinning
