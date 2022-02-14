# Lab 1: Lukas Kudrna

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

Main function

<img src="https://latex.codecogs.com/svg.image?\bg_white&space;f_{cba}=&space;\bar{b}\cdot&space;a&space;&plus;&space;\bar{c}&space;\cdot&space;\bar{b}&space;" title="\bg_white f_{cba}= \bar{b}\cdot a + \bar{c} \cdot \bar{b} " />
function NOR only
<img src="https://latex.codecogs.com/svg.image?\bg_white&space;f_{cba_{(NOR)}}=&space;\overline{b&space;&plus;&space;\bar{a}}&space;&plus;&space;\overline{c&space;&plus;&space;b}" title="\bg_white f_{cba_{(NOR)}}= \overline{b + \bar{a}} + \overline{c + b}" />
function NAND only
<img src="https://latex.codecogs.com/svg.image?\bg_white&space;f_{cba_{(NAND)}}=&space;\bar{b}&space;\cdot&space;(\overline{\bar{a}&space;&plus;&space;c})" title="\bg_white f_{cba_{(NAND)}}= \bar{b} \cdot (\overline{\bar{a} + c})" />
   


2. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of demorgan is
begin
    f_o     <= (not b_i and a_i) or (not c_i and not b_i);
    fnand_o <= (not (b_i)) and (not( not(a_i) and c_i));
    fnor_o  <= (not(b_i or not a_i)) or (not( c_i or b_i));
end architecture dataflow;
```

3. Complete table with logic functions' values:

| **c** | **b** |**a** | **f(c,b,a)** | **f_NAND(c,b,a)** | **f_NOR(c,b,a)** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 | 1 | 1 |
| 0 | 0 | 1 | 1 | 1 | 1 |
| 0 | 1 | 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 | 0 | 0 |
| 1 | 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 | 1 | 1 |
| 1 | 1 | 0 | 0 | 0 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 |

### Distributive laws

1. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

  ![image](https://user-images.githubusercontent.com/99397107/153917091-66088df6-c0f9-483e-a5e1-6edcebdac1a0.png)



2. Link to your public EDA Playground example:

  https://www.edaplayground.com/x/wU3z
