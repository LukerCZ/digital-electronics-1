# Nexys board mono audio output and PWM sound generation. Generate basic signals and/or audio samples.
## "Generace signálů a monofonních zvuků pomocí pulzně šířkové modulace vytvořené na multifunkční desce Nexys A7 50T"

### Členové týmu

* Dominik Caban (zodpovídá za analogové části a vytváření signálu (SIN, PWM,TEST BENCH)
* Ivo Dovičák (generování signálů a zvuků (SIN, PWM, BLOCK SCHEMATIC)
* Martin Kováč (prezentace projektu a uživatelské rozhraní)
* Lukáš Kudrna (Finální dokumentace projektu a uživatelské rozhraní)

### Obsah

* [Cíle projektu](#objectives)
* [Popis Hardwaru](#hardware)
* [Popis a simulace modulů psané ve VHDL](#modules)
* [Popis a simulace TOP vrstvy ve VHDL](#top)
* [Video](#video)
* [Literatura](#references)

<a name="objectives"></a>

## Cíle projektu

The objective of the project within the subject Digital electronics was to create PWM sound generation of basic signals. We used these components. Nexys A7-50 board to control 7-segment display to display frequency of PWM modulation for sinus signal. The codes, testbenches and simulations are created in Vivado. Models and designes of board are created in Altium.

<a name="hardware"></a>

## Popis Hardwaru
### Nexys A7-50T
The Nexys A7 board is a complete, ready-to-use digital circuit development platform based on the latest Artix-7™ Field Programmable Gate Array (FPGA) from Xilinx®.  With its large, high-capacity FPGA, generous external memories, and collection of USB, Ethernet, and other ports, the Nexys A7 can host designs ranging from introductory combinational circuits to powerful embedded processors. Several built-in peripherals, including an accelerometer, temperature sensor, MEMs digital microphone, a speaker amplifier, and several I/O devices allow the Nexys A7 to be used for a wide range of designs without needing any other components.

- Deska Nexys A7 je platforma na bázi Artix-7™ Field Programmable Gate Array (FPGA) z Xilinx®. Obsahuje vysokokapacitní FPGA, externí paměti, USB, Ethernet, a další porty, Nexys A7 může host designů ranging z introduktorů kombinačních obvodů do powerful embedded processors. Severální budovy v peripherals, zahrnující accelerometr, teplotní senzor, MEMs digitální mikrofon, reproduktory amplifier, a severní I/O zařízení na nexys A7 bude použita pro širokou škálu designů s nepotřebnou any ostatní komponenty.

![nexys-a7-obl-600](https://user-images.githubusercontent.com/99388246/165694448-dfccf257-62a9-4c5e-bb68-ceab544a98f1.png)
|:--:| 
|*Nexys A7-50T*|

### Zesilovač

- Do našeho studentského projektu jsme zakomponovali také vývojový kit - výstupní zesilovač s nastavitelným ziskem. Hlavní smysl našeho zesilovače je v rámci výuky přiblížit studentům samotný HW (ovšem vývojový kit od XILINX v našem případě deska Nexys A7-50T naprosto stačí).
- Tento zesilovač by v případě realizace (GERBERY sú uvedené v prílohách projektu, ten QR kód funguje :)) sloužil na nastavení výstupní amplitudy signálu tj. větší zesílení zvuku.
- Na vstupu zesilovače je zavedena ochrana proti nesprávnému zapojení napájecího napětí (polaritě),TVS (ochranná dioda) proti přesáhnutí maximálního napětí přivedeného na zesilovač a Low-pass filter pro potlačení rušení. 
- Např. při napájení zesilovače z USB notebooku, můžeme dostat nasuperponované vysokofrekvenční rušení a tento filtr nám dokáže tyto nebezpečné složky potlačit.
- Návrh zesilovače je realizovaný pomocí aplikace Altium Limited software, kde po návrhnutí schématu se vytvoří DPS viz. obrázky níže.

![278620852_1021410442135136_7154315500152959101_n](https://user-images.githubusercontent.com/99388246/165693223-0a94e4e5-78b2-440c-bc23-228c8eb99cf3.png)
|:--:| 
|*Model desky zesilovače*|

![278885036_353535676806500_6518462935903523547_n](https://user-images.githubusercontent.com/99388246/165693208-ae4fd1d9-7659-4385-9e47-1a015b2743d0.png)

<a name="modules"></a>

## Popis a simulace modulů psané ve VHDL



### Modul Sin_gen 

- text about this module



#### Kód modulu Sin-gen
https://github.com/KovacM1/DE1-project/blob/main/project/PWM_waveform_generator2/PWM_waveform_generator2.srcs/sources_1/imports/new/COUNTER_UpDw_14b.vhd


### Modul SW handler 

- text about this module

#### Kód modulu SW handler


### Modul PWM_gen

- text about this module

#### Kód modulu PWM_gen
https://github.com/KovacM1/DE1-project/blob/main/project/PWM_waveform_generator2/PWM_waveform_generator2.srcs/sources_1/imports/new/PWM.vhd


### Modul Driver-7seg

- text about this module

#### Kód modulu Driver-7seg
https://github.com/KovacM1/DE1-project/blob/main/project/PWM_waveform_generator2/PWM_waveform_generator2.srcs/sources_1/imports/new/driver_7seg_4digits.vhd

### Simulace
- text ohľadom simulácií.

|:--:| 
|*Schéma simulací v prostředí Vivado*|

Minimum                    |Maximum
:-------------------------:|:-------------------------:
![MIN](https://user-images.githubusercontent.com/99397107/165824665-f28134af-fd2a-4e1f-8857-7d2d55cf2aeb.JPG)|![MAX](https://user-images.githubusercontent.com/99397107/165824905-91994a5c-5f9b-44cf-b043-a7ce4f09109b.JPG)


Middle                     |Průchod nulou
:-------------------------:|:-------------------------:
![MIDDLE](https://user-images.githubusercontent.com/99397107/165825357-6f038a63-20d1-4ff8-b063-57b1a8716338.JPG)
  |  ![PrechodNulou](https://user-images.githubusercontent.com/99397107/165825387-5c306b4b-8cd2-4e24-94c8-fac82572a6bc.JPG)



|:--:| 
|*Schéma simulací v prostředí Vivado*|

<a name="top"></a>

## Popis a simulace TOP vrstvy ve VHDL

Top module contains all above modules. It connects them together with hardware components.

### Kód TOP modulu
https://github.com/KovacM1/DE1-project/blob/main/project/PWM_waveform_generator2/PWM_waveform_generator2.srcs/sim_1/imports/new/tb_TOP_GENERATOR.vhd

![TOP_Schema](https://user-images.githubusercontent.com/99397107/165823085-27287982-7e3d-4061-8c78-0134287f429d.JPG)
|:--:| 
|*Schéma Top modulu*|

<a name="video"></a>

## Video

Write your text here

<a name="references"></a>1


## Diskuze o výsledcích projektu

- Ideálnější variantou by bylo využití VGA zesilovače, který by byl řiditelný přes vývojový kit, ovšem realizace v tomto konkrétním případě by byla komplikovaná a projekt by jen zkomplikovala.

## Literatura

1. Nexys A7 Reference Manual: 
- https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual?redirect=1
2. Github:
- https://github.com/tomas-fryza/digital-electronics-1/tree
- 
3. Sine wave generator using PWM:
- https://www.ti.com/lit/an/spna217/spna217.pdf?
 
4. Datasheet of operational amplifier:
- https://www.analog.com/media/en/technical-documentation/data-sheets/ad8591_8592_8594.pdf

5. Nexys A7-50T References: 
- https://digilent.com/reference/_media/reference/programmable-logic/nexys-a7/nexys-a7-sch.pdf
- https://digilent.com/reference/_media/reference/programmable-logic/nexys-a7/nexys-a7_rm.pdf


