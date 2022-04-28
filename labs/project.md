# Nexys board mono audio output and PWM sound generation. Generate basic signals and/or audio samples.

### Team members

* Dominik Caban (responsible for analog part and generating signal (SIN, PWM, TEST BENCH)
* Ivo Dovičák (responsible for generating signals (SIN, PWM, BLOCK SCHEMATIC))
* Martin Kováč (responsible for Presentation of the project (VIDEO) and display interface)
* Lukáš Kudrna (responsible for Final documentation (GIT) and user interface)

### Table of contents

* [Project objectives](#objectives)
* [Hardware description](#hardware)
* [VHDL modules description and simulations](#modules)
* [TOP module description and simulations](#top)
* [Video](#video)
* [References](#references)

<a name="objectives"></a>

## Project objectives

The objective of the project within the subject Digital electronics was to create PWM sound generation of basic signals. We used these components. Nexys A7-50 board to control 7-segment display to display frequency of PWM modulation for sinus signal. The codes, testbenches and simulations are created in Vivado. Models and designes of board are created in Altium.

<a name="hardware"></a>

## Hardware description
### Nexys A7-50T
The Nexys A7 board is a complete, ready-to-use digital circuit development platform based on the latest Artix-7™ Field Programmable Gate Array (FPGA) from Xilinx®.  With its large, high-capacity FPGA, generous external memories, and collection of USB, Ethernet, and other ports, the Nexys A7 can host designs ranging from introductory combinational circuits to powerful embedded processors. Several built-in peripherals, including an accelerometer, temperature sensor, MEMs digital microphone, a speaker amplifier, and several I/O devices allow the Nexys A7 to be used for a wide range of designs without needing any other components.

- Deska Nexys A7 je platforma na bázi Artix-7™ Field Programmable Gate Array (FPGA) z Xilinx®. Obsahuje vysokokapacitní FPGA, externí paměti, USB, Ethernet, a další porty, Nexys A7 může host designů ranging z introduktorů kombinačních obvodů do powerful embedded processors. Severální budovy v peripherals, zahrnující accelerometr, teplotní senzor, MEMs digitální mikrofon, reproduktory amplifier, a severní I/O zařízení na nexys A7 bude použita pro širokou škálu designů s nepotřebnou any ostatní komponenty.

![nexys-a7-obl-600](https://user-images.githubusercontent.com/99388246/165694448-dfccf257-62a9-4c5e-bb68-ceab544a98f1.png)
|:--:| 
|*Nexys A7-50T*|

### Amplifier board
![278620852_1021410442135136_7154315500152959101_n](https://user-images.githubusercontent.com/99388246/165693223-0a94e4e5-78b2-440c-bc23-228c8eb99cf3.png)
|:--:| 
|*Model of amplifier board*|

![278885036_353535676806500_6518462935903523547_n](https://user-images.githubusercontent.com/99388246/165693208-ae4fd1d9-7659-4385-9e47-1a015b2743d0.png)

<a name="modules"></a>

## VHDL modules description and simulations



### Sin_gen module

- text about this module

#### Code for module
https://github.com/KovacM1/DE1-project/blob/main/project/PWM_waveform_generator2/PWM_waveform_generator2.srcs/sources_1/imports/new/COUNTER_UpDw_14b.vhd


### SW handler module

- text about this module

#### Code for module


### PWM_gen module

- text about this module

#### Code for module
https://github.com/KovacM1/DE1-project/blob/main/project/PWM_waveform_generator2/PWM_waveform_generator2.srcs/sources_1/imports/new/PWM.vhd


### Driver-7seg module

- text about this module

#### Code for module
https://github.com/KovacM1/DE1-project/blob/main/project/PWM_waveform_generator2/PWM_waveform_generator2.srcs/sources_1/imports/new/driver_7seg_4digits.vhd

### Simulations
- text ohľadom simulácií.


<a name="top"></a>

## TOP module description and simulations

Top module contains all above modules. It connects them together with hardware components.

### Top module code 
https://github.com/KovacM1/DE1-project/blob/main/project/PWM_waveform_generator2/PWM_waveform_generator2.srcs/sim_1/imports/new/tb_TOP_GENERATOR.vhd

|:--:| 
|*Top modul schema*|

<a name="video"></a>

## Video

Write your text here

<a name="references"></a>

## References

1. Nexys A7 Reference Manual https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual?redirect=1
