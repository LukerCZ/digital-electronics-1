
# Generace signálů a monofonních zvuků <br>pomocí pulzně šířkové modulace <br> vytvořené na multifunkční desce Nexys A7-50T

### Členové týmu

**Dominik Caban** <br>
- návrh zesilovače a vytváření signálu (SIN, PWM, BLOCK SCHEMATIC), proslov u videa

**Ivo Dovičák** <br>
- generování signálů a zvuků (SIN, PWM, TEST BENCH)

**Martin Kováč**  <br>
- střih a finální úprava videa a uživatelské rozhraní (Switch)

**Lukáš Kudrna** <br>
- finální dokumentace projektu (README.md) a uživatelské rozhraní (displej)

### Obsah

* [Cíle projektu](#objectives)
* [Popis Hardwaru](#hardware)
* [Popis a simulace modulů psané ve VHDL](#modules)
* [Popis a simulace TOP vrstvy ve VHDL](#top)
* [Video](#video)
* [Literatura](#references)

<a name="objectives"></a>

## Cíle projektu

- využít desku Nexys A7-50 pro PWM generování zvuku základních signálů.
- využít desku Nexys A7-50 pro ovládání 7segmentového displeje a zobrazení frekvence PWM modulace pro sinusový signál. 
- vytvořit kód a simulace v prostředí Vivada.
- vytořit schému a návrh desky v prostředí Altia (PCB Design Software).

<a name="hardware"></a>

## Popis Hardwaru
### Nexys A7-50T

Deska Nexys A7 je kompletní platforma pro vývoj digitálních obvodů, založená na nejnovějším Artix-7™ Field Programmable Gate Array (FPGA) od Xilinx®. Díky velkému, vysokokapacitnímu FPGA, velkorysým externím pamětem a nabídce spousty portů - USB, Ethernet a dalších, může Nexys A7 hostit návrhy od úvodních kombinačních obvodů až po výkonné vestavěné procesory. Několik vestavěných periferních zařízení, včetně akcelerometru, teplotního senzoru, digitálního mikrofonu MEM, zesilovače reproduktorů a několika I/O zařízení, umožňuje využít vývojovou desku Nexys A7-50T pro širokou škálu návrhů, bez nutnosti připojení externího hardwaru.


![nexys-a7-obl-600](https://user-images.githubusercontent.com/99388246/165694448-dfccf257-62a9-4c5e-bb68-ceab544a98f1.png)
 <fig caption> <p align="center"> Nexys A7-50T

### Zesilovač

- Do našeho studentského projektu jsme zakomponovali také vývojový kit - výstupní zesilovač s nastavitelným ziskem. Hlavní smysl našeho zesilovače je v rámci výuky přiblížit studentům samotný HW (ovšem vývojový kit od XILINX v našem případě deska Nexys A7-50T naprosto stačí).
- Tento zesilovač by v případě realizace (GERBERY sú uvedené v prílohách projektu, ten QR kód funguje :)) sloužil na nastavení výstupní amplitudy signálu tj. větší zesílení zvuku.
- Na vstupu zesilovače je zavedena ochrana proti nesprávnému zapojení napájecího napětí (polaritě),TVS (ochranná dioda) proti přesáhnutí maximálního napětí přivedeného na zesilovač a Low-pass filter pro potlačení rušení. 
- Např. při napájení zesilovače z USB notebooku, můžeme dostat nasuperponované vysokofrekvenční rušení a tento filtr nám dokáže tyto nebezpečné složky potlačit.
- Návrh zesilovače je realizovaný pomocí aplikace Altium Limited software, kde po návrhnutí schématu se vytvoří DPS viz. obrázky níže.


3D Model desky zesilovače <br> (Vrchní pohled) |Layoutový pohled desky zesilovače <br> (Vrchní pohled)
:-------------------------:|:-------------------------:
![278620852_1021410442135136_7154315500152959101_n](https://user-images.githubusercontent.com/99388246/165693223-0a94e4e5-78b2-440c-bc23-228c8eb99cf3.png)|![278885036_353535676806500_6518462935903523547_n](https://user-images.githubusercontent.com/99388246/165693208-ae4fd1d9-7659-4385-9e47-1a015b2743d0.png)

3D Model desky zesilovače <br> (Spodní pohled)|Layoutový pohled desky zesilovače <br> (Spodní pohled)
:-------------------------:|:-------------------------:
![TOP_LR_VIEW](https://user-images.githubusercontent.com/99397107/165839082-08e70d71-ed08-4b9f-8b42-5cba28c647ea.JPG)|![BOT_LR_VIEW](https://user-images.githubusercontent.com/99397107/165839125-298f1211-196a-41d6-ac05-d930292057f7.JPG)

![0001](https://user-images.githubusercontent.com/99397107/165841715-2b7259a5-c591-4f51-b733-d8ca7df2b477.jpg)
<fig caption> <p align="center"> Schéma desky zesilovače

<a name="modules"></a>

## Popis a simulace modulů psané ve VHDL

### Modul Sin_gen 
 
-	Modul sin_gen slúži na generáciu jednotlivých úrovní striedy, ktorou sa riadi PWM generátor. Vstupom sin generátora je výstupná frekvencia zo sw_handlera
-	Sínus sme rozdelili na 36 častí, ktoré sme vytvorili pomocou excelu a pomocou signálu s_data_cnt volíme správnu hodnotu pre časový okamžik. Signálom s_treshold, ktorý je riadený vstupom FREQ ovládame periódu každého PWM pulzu a tým pádom aj frekvenciu výslednej sínusoidy. 

#### Odkaz na kód modulu Sin-gen
https://github.com/DominikCaban/digital-electronics-1/blob/main/projekt_sinus/de1_projekt.srcs/sources_1/new/sin_generator.vhd

### Modul SW handler 

- Switch handler slúži na spravcovanie vstupu z prepínačov a jeho výstupom je frekvencia jednotlivých tónov. Jeho ďalším výstupom sú hodnoty data0_i a data1_i, ktoré slúžia na zobrzovanie aktuálne znejúceho tónu.

#### Odkaz na kód modulu SW handler
https://github.com/DominikCaban/digital-electronics-1/blob/main/projekt_sinus/de1_projekt.srcs/sources_1/new/switch_handler.vhd

### Modul PWM_gen

- Modul PWM_GEN slúži na generáciu šírkovo modulovaného signálu. Vhodným postupným volením striedy vieme dostať rôzne typy signálov. V našom prípade ide o harmonický signál sínus.
- Generovanie PWM signálov je jednoduché. Vedieme signál s_cnt, ktorým počítame časové impulzy a kontrolujeme či sme nedosiahli požadovanú striedu porovnávaním so signálom s_duty_old.
 
#### Odkaz na kód modulu PWM_gen
https://github.com/DominikCaban/digital-electronics-1/blob/main/projekt_sinus/de1_projekt.srcs/sources_1/new/pwm_generator.vhd


### Modul Driver-7seg

- Modul driver_seg4 je upravenou verziou ovládača 7-segmentových displejov, ktoré sme využili z cvičení. Úprava spočívala v použití nového prevodníka z BCD na výstupy katód hex_7seg_letters , ktorý miesto čísiel zobrazoval tóny. Išlo o improvizovanú špeciálnu úpravu prevodníku hex_7seg, ktorý bol navrhnutý na cvičení DE1.

#### Odkaz na kód modulu Driver-7seg
https://github.com/DominikCaban/digital-electronics-1/blob/main/projekt_sinus/de1_projekt.srcs/sources_1/new/driver_7seg_4digits.vhd

### Výsledek testbench z prostředí Vivada

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

Nota C4 <br> frekvence = ~261 Hz (Min)  |Nota C5 <br> frekvence = ~523 Hz (Max)
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
 
https://youtu.be/nLSVV8CweyI
<a name="references"></a>

## Diskuze o výsledcích projektu

- Ideálnější variantou by bylo využití VGA zesilovače, který by byl řiditelný přes vývojový kit, ovšem realizace v tomto konkrétním případě by byla komplikovaná a projekt by jen zkomplikovala.
- Projekt nám přinesl vela radosti, zabavili jsme se u toho a naučili jsme se mnoho nových věcí.

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
6. Výsledné Altium soubory + Gerber
- https://onedrive.live.com/?authkey=%21AFWKRFpeO7ds%2D%5FY&cid=3D59FBAD3CECD394&id=3D59FBAD3CECD394%2173346&parId=3D59FBAD3CECD394%2171179&action=locate


