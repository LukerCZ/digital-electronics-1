### Preparation tasks (done before the lab at home)

See schematic or reference manual of the Nexys A7 board, find out the connection of 7-segment displays, and complete the signal timing to display four-digit value 3.142.

![image](https://user-images.githubusercontent.com/99397107/159808181-5ee90535-57d5-4194-b4ff-e2bc6ccc16e0.png)

![image](https://user-images.githubusercontent.com/99397107/159808084-8e0fc884-7d80-4182-a56d-b83790e093e5.png)

![image](https://user-images.githubusercontent.com/99397107/159808241-d7bb4f59-f6bd-4ed8-9894-24f0974c097c.png)
```vhdl
{
  signal:
  [
    ['Digit position',
      {name: 'Common anode: AN(3)', wave: 'xx01..01..01'},
      {name: 'AN(2)', wave: 'xx101'},
      {name: 'AN(1)', wave: 'xx1.'},
      {name: 'AN(0)', wave: 'xx1.'},
    ],
    ['Seven-segment data',
      {name: '4-digit value to display', wave: 'xx3333555599', data: ['3','1','4','2','3','1','4','2','3','1']},
      {name: 'Cathod A: CA', wave: 'xx01.0.1.0.1'},
      {name: 'Cathod B: CB', wave: 'xx0.'},
      {name: 'CC', wave: 'xx0.'},
      {name: 'CD', wave: 'xx01'},
      {name: 'CE', wave: 'xx1.'},
      {name: 'CF', wave: 'xx1.'},
      {name: 'Cathod G: CG', wave: 'xx01'},
    ],
    {name: 'Decimal point: DP', wave: 'xx01..01..01'},
  ],
  head:
  {
    text: '                    4ms   4ms   4ms   4ms   4ms   4ms   4ms   4ms   4ms   4ms',
  },
}
```
