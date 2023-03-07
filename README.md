# [EC616](https://doc.soc.xin/EC616)

* [eigencomm](http://www.eigencomm.com/): [Cortex-M3](https://github.com/SoCXin/Cortex)
* [L3R2](https://github.com/SoCXin/Level): 204 MHz

## [简介](https://github.com/SoCXin/EC616/wiki)

[EC616](https://www.hdsc.com.cn/Category83-1499) 是上海移芯通信科技有限公司完全自主研发的超低成本、超低功耗和超高集成度NB-IoT SoC芯片，完全支持3GPP R13/R14 NB-IoT标准。

EC616S单芯片集成射频收发机、PA、全部射频前端以及电源管理，极少的外围器件数量，可大幅降低下游客户BOM 成本。其支持2.2~4.5V宽电压输入，PSM休眠态电流低至0.8uA。

### 关键参数

* 204 MHz Cortex-M3
* 192KB SRAM + 512KB FLASH
* NB-IoT: CAT-NB2、2-Harq、OTDOA
* TX 23dBm, RX 117dBm
* 最大支持 26 GPIO，6个AON GPIO，能够在深度睡眠的时候，仍保持有效输出。
* SPI×2，I2C×2，USART×3，PWM×6，ADC×4，USIM×1
* 宽供电电压: 2.2 -  4.5V
* QFN52 (6mm*6mm*0.9mm)
* 低功耗
    *  独特的低功耗架构，4 级睡眠模式
    *  PSM: 800nA
    *  DRX (2.56s): 典型值 110uA
    *  RX: 典型值 10mA
    *  TX: 典型值 24mA

## [资源收录](https://github.com/SoCXin)

* [参考资源](src/)
* [参考文档](docs/)
* [参考工程](project/)

## [选型建议](https://github.com/SoCXin)

2018年发布的[EC616](https://github.com/SoCXin/EC616) 相关竞品包括[MT2625](https://github.com/SoCXin/MT2625)、[XY1100](https://github.com/SoCXin/XY1100)等，基于AIR302的模组使用[LuatOS](https://gitee.com/openLuat/LuatOS)生态。

相关产品包括：EC616S/EC616L，和升级版本EC626。