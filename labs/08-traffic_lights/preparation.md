<a name="preparation"></a>

## Preparation tasks (done before the lab at home)

##### 1. See [schematic](https://github.com/tomas-fryza/digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of two RGB LEDs, ie to which FPGA pins are connected and how. How you can control them to get red, yellow, or green colors? Draw the schematic with RGB LEDs.

| **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
| :-: | :-: | :-: | :-: | :-: |
| LD16 | N15, M16, R12 | `1,0,0` | `1,1,0` | `0,1,0` |
| LD17 | N16 | R11 | G14 | `1,0,0` | `1,1,0` | `0,1,0` |

![image](https://user-images.githubusercontent.com/99397107/160697156-e9ea71c5-4bc7-4f47-9a87-e68209f20f32.png)

##### 2. See [schematic](https://github.com/tomas-fryza/digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out to which FPGA pins Pmod ports JA, JB, JC, and JD are connected.

![image](https://user-images.githubusercontent.com/99397107/160698376-38655055-3122-4967-a249-d58bedb695c9.png)

<a name="part1"></a>
