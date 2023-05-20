# StarRail-EasyScript
用于游戏`Honkai:StarRail`PC端的快捷键脚本，简化鼠标点点点的冗余操作。

## 注意事项
1. 个人主力设备为`21:9`分辨率，一切更新围绕`2560*1080`或`3440*1440`分辨率进行。
2. 想要兼容自己的分辨率，可以尝试自行在`module`下的每个功能修改`Class`中的`Point`点位数据
   <br>
   **目前想不到什么好的写法做到多种分辨率兼容且写法优雅，有好的办法可以举例说明**
3. 脚本语言为`AHK2.0`，请自行前往官网安装环境（官网环境安装可多版本兼容）
4. 要启动脚本，请以管理员模式启动`SRES.ahk`，否则无法在游戏窗口使用

## 目前功能
|     键位     | 建议使用场景 |               功能               |
| :----------: | :----------: | :------------------------------: |
| `Ctrl+Alt+R` |   `无限制`   |      重载脚本，调试功能用*       |
|  `Ctrl+Esc`  |   `无限制`   |          关闭游戏和脚本          |
| 长按`Space`  |   `无限制`   |         高频循环触发空格         |
|   `Ctrl+T`   |  `地图界面`  | 点击一次地图锚点，按下后快速传送 |
|  `Ctrl+F3`   | `游戏主画面` |         收取所有成就奖励         |
|  `Ctrl+F2`   | `游戏主画面` |             纪行奖励             |
|  `Ctrl+F1`   | `游戏主画面` |           委托奖励[^1]           |

[^1]: 目前只做了获取奖励+重复上一次派遣，没有需求就不做指定派遣了


## 游戏已经内置的快捷键
> 已经有快捷键的当然没必要做了.jpg

| 键位  | 建议使用场景 |     功能     |
| :---: | :----------: | :----------: |
|  `V`  |  `战斗场景`  | 自动挂机开关 |
|  `B`  |  `战斗场景`  |  双倍速开关  |


## TODO
- [ ] 每日实训奖励领取（活跃度奖励）
- [x] 每日派遣（委托）

## 免责声明
> 1. 脚本为自用，利用空余时间更新，一切以个人习惯优先
> 2. 脚本不盈利，只对软件窗口取色识别+键鼠固定操作复现，未修改游戏数据，无利益相关
> 3. 如有任何传播时添油加醋的行为，与本人无关
> 4. 请遵守`GPLv3`协议，禁止打包出售（或修改后打包出售）
> 5. 参与讨论默认你已理解本脚本的原理，并知晓一定计算机知识
> 6. 未修改游戏数据，不是外挂，理清楚再说话，别当小丑