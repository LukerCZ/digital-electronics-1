
# Generace signálů a monofonních zvuků pomocí pulzně šířkové modulace vytvořené na multifunkční desce Nexys A7-50T

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

Cílem projektu v rámci předmětu Digitální elektronika bylo vytvořit PWM generování zvuku základních signálů. Tyto komponenty jsme použili. Deska Nexys A7-50 pro ovládání 7segmentového displeje pro zobrazení frekvence PWM modulace pro sinusový signál. Kódy, testovací plochy a simulace jsou vytvořeny ve Vivado. Modely a návrhy desky jsou vytvořeny v Altiu.

<a name="hardware"></a>

## Popis Hardwaru
### Nexys A7-50T

Deska Nexys A7 je kompletní platforma pro vývoj digitálních obvodů, založená na nejnovějším Artix-7™ Field Programmable Gate Array (FPGA) od Xilinx®. Díky velkému, vysokokapacitnímu FPGA, velkorysým externím pamětem a nabídce spousty portů - USB, Ethernet a dalších, může Nexys A7 hostit návrhy od úvodních kombinačních obvodů až po výkonné vestavěné procesory. Několik vestavěných periferních zařízení, včetně akcelerometru, teplotního senzoru, digitálního mikrofonu MEM, zesilovače reproduktorů a několika I/O zařízení, umožňuje využít vývojovou desku Nexys A7-50T pro širokou škálu návrhů, bez nutnosti připojení externího hardwaru.


![nexys-a7-obl-600](https://user-images.githubusercontent.com/99388246/165694448-dfccf257-62a9-4c5e-bb68-ceab544a98f1.png)
|:--:| 
|*Nexys A7-50T*|


### Zesilovač

- Do našeho studentského projektu jsme zakomponovali také vývojový kit - výstupní zesilovač s nastavitelným ziskem. Hlavní smysl našeho zesilovače je v rámci výuky přiblížit studentům samotný HW (ovšem vývojový kit od XILINX v našem případě deska Nexys A7-50T naprosto stačí).
- Tento zesilovač by v případě realizace (GERBERY sú uvedené v prílohách projektu, ten QR kód funguje :)) sloužil na nastavení výstupní amplitudy signálu tj. větší zesílení zvuku.
- Na vstupu zesilovače je zavedena ochrana proti nesprávnému zapojení napájecího napětí (polaritě),TVS (ochranná dioda) proti přesáhnutí maximálního napětí přivedeného na zesilovač a Low-pass filter pro potlačení rušení. 
- Např. při napájení zesilovače z USB notebooku, můžeme dostat nasuperponované vysokofrekvenční rušení a tento filtr nám dokáže tyto nebezpečné složky potlačit.
- Návrh zesilovače je realizovaný pomocí aplikace Altium Limited software, kde po návrhnutí schématu se vytvoří DPS viz. obrázky níže.


3D Model desky zesilovače        (Vrchní pohled) |Layoutový pohled desky zesilovače        (Vrchní pohled)
:-------------------------:|:-------------------------:
![278620852_1021410442135136_7154315500152959101_n](https://user-images.githubusercontent.com/99388246/165693223-0a94e4e5-78b2-440c-bc23-228c8eb99cf3.png)|![278885036_353535676806500_6518462935903523547_n](https://user-images.githubusercontent.com/99388246/165693208-ae4fd1d9-7659-4385-9e47-1a015b2743d0.png)

3D Model desky zesilovače       (Spodní pohled)|Layoutový pohled desky zesilovače       (Spodní pohled)
:-------------------------:|:-------------------------:
![TOP_LR_VIEW](https://user-images.githubusercontent.com/99397107/165839082-08e70d71-ed08-4b9f-8b42-5cba28c647ea.JPG)|![BOT_LR_VIEW](https://user-images.githubusercontent.com/99397107/165839125-298f1211-196a-41d6-ac05-d930292057f7.JPG)

<a name="modules"></a>

## Popis a simulace modulů psané ve VHDL

### Modul Sin_gen 

- text about this module

#### Odkaz na kód modulu Sin-gen
https://github.com/DominikCaban/digital-electronics-1/blob/main/projekt_sinus/de1_projekt.srcs/sources_1/new/sin_generator.vhd

### Modul SW handler 

- text about this module

#### Odkaz na kód modulu SW handler
https://github.com/DominikCaban/digital-electronics-1/blob/main/projekt_sinus/de1_projekt.srcs/sources_1/new/switch_handler.vhd

### Modul PWM_gen

- text about this module

#### Odkaz na kód modulu PWM_gen
https://github.com/DominikCaban/digital-electronics-1/blob/main/projekt_sinus/de1_projekt.srcs/sources_1/new/pwm_generator.vhd


### Modul Driver-7seg

- text about this module

#### Odkaz na kód modulu Driver-7seg
https://github.com/DominikCaban/digital-electronics-1/blob/main/projekt_sinus/de1_projekt.srcs/sources_1/new/driver_7seg_4digits.vhd

### Simulace PWM pro sinus v prostředí Vivado


Střed                      |Průchod nulou
:-------------------------:|:-------------------------:
![MIDDLE](https://user-images.githubusercontent.com/99397107/165825357-6f038a63-20d1-4ff8-b063-57b1a8716338.JPG)|![PrechodNulouFIN](https://user-images.githubusercontent.com/99397107/165826258-7d612401-1e23-45be-a742-2d1f50f00cf4.jpg)

<a name="top"></a>

## Popis a simulace TOP vrstvy ve VHDL

TOP modul v sobě "skrývá" všechny moduly a umožnuje je připojit k hardwarových komponentům (v našem ppřípadě deska Nexys A7-50T)

### Odkaz na kód TOP modulu
https://github.com/DominikCaban/digital-electronics-1/blob/main/projekt_sinus/de1_projekt.srcs/sources_1/new/top.vhd

![TOP_Schema](https://user-images.githubusercontent.com/99397107/165823085-27287982-7e3d-4061-8c78-0134287f429d.JPG)
|:--:| 
|*Schéma Top modulu*|

<a name="video"></a>
### Příklad výstupních signálů (noty) zobrazených osciloskopicky

Nota C4, frekvence = ~261 Hz (Min)  |Nota C5, frekvence = ~523 Hz (Max)
:-------------------------:|:-------------------------:
![C4](https://user-images.githubusercontent.com/99397107/165827889-ef8b4e22-0047-4556-83de-5ffc1c3d3463.png)|![C5](https://user-images.githubusercontent.com/99397107/165827930-9ff21b77-6a6a-4173-8dd5-d9f67f891dd6.png)

### Nota C5: Min, Max, Střed a Spektrum sinusového signálu (oscilogramy)

Minimum sinusoidy          |Maximum sinusoidy
:-------------------------:|:-------------------------:
![C5_MIN](https://user-images.githubusercontent.com/99397107/165830655-b29274e9-168a-4838-9db8-21de372fa88c.png)|![C5_MAX](https://user-images.githubusercontent.com/99397107/165830683-88cb7ced-67a9-4b66-be49-cc60672f50a2.png)

Střed sinusoidy             |Spektrum sinusoidy
:-------------------------:|:-------------------------:
![C5_MID](https://user-images.githubusercontent.com/99397107/165830888-39846d89-9cd3-4b81-b038-4d63b277ad6b.png)|![C5_Spektrum](https://user-images.githubusercontent.com/99397107/165830906-6ef4ea90-2434-49d2-9d60-5067d2526a32.png)

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
 
3. Sine wave generator using PWM:
- https://www.ti.com/lit/an/spna217/spna217.pdf?
 
4. Datasheet of operational amplifier:
- https://www.analog.com/media/en/technical-documentation/data-sheets/ad8591_8592_8594.pdf

5. Nexys A7-50T References: 
- https://digilent.com/reference/_media/reference/programmable-logic/nexys-a7/nexys-a7-sch.pdf
- https://digilent.com/reference/_media/reference/programmable-logic/nexys-a7/nexys-a7_rm.pdf


