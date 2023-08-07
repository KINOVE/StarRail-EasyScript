# StarRail-EasyScript
用于游戏`Honkai:StarRail`PC端的快捷键脚本，简化鼠标点点点的冗余操作。

## 分辨率适配情况
| 目标分辨率  | 屏幕比例 | 适配情况 |
| :---------: | :------: | :------: |
| `2560*1080` |  `21:9`  |    ✅     |
| `3440*1440` |  `21:9`  |    ✅     |
|    `Any`    |  `16:9`  |  ❕[^!]   |

[^!]: 已做兼容处理，但缺少点位数据，需要自行利用截图工具对照点位进行适配。

## 注意事项
1. 个人主力设备为`21:9`分辨率，一切更新围绕`2560*1080`或`3440*1440`分辨率进行。
2. 想要兼容自己的分辨率（如`16:9`），请参考 `->` [多分辨率兼容](./files/docs/Multiresolution.md)
3. GUI?目前用不到，需要的话提一下`issue`
4. 项目是看着`AHK2`的文档一点点啃的，没写过`AHK1`，所以可能会有部分旧功能的实现方式很奇怪。

## 安装&使用方式
> 唯一建议方式如下，不提供打包好的`.exe`。原因如下：
> 脚本编写过程中测试困难（测试环境做完一次就没了，每日刷新）。
> 因此稳定版本很难保证，最稳定的版本往往是最新的仓库代码。
1. 前往[`AutoHotKey`官网](https://www.autohotkey.com/)，下载`AHK2`统一脚本环境（该环境兼容`AHK1`，不影响其他AHK脚本）
2. 使用`git`克隆仓库代码
3. 以管理员模式启动启动`SRES.ahk`，否则无法在游戏窗口使用
4. 需要更新时，`pull`仓库即可

## 目前功能
|       键位        |    建议使用场景     |                功能                |
| :---------------: | :-----------------: | :--------------------------------: |
|   `Ctrl+Alt+R`    |      `无限制`       |      重载脚本，调试功能用[^*]      |
|    `Ctrl+Esc`     |      `无限制`       |           关闭游戏和脚本           |
|    长按`Space`    |      `无限制`       |          高频循环触发空格          |
|      `Alt+E`      |      `无限制`       |           快速加减锁遗器           |
|     `Ctrl+T`      |     `地图界面`      |  点击一次地图锚点，按下后快速传送  |
|     `Ctrl+F4`     |    `游戏主画面`     |        收取所有每日实训奖励        |
|     `Ctrl+F3`     |    `游戏主画面`     |          收取所有成就奖励          |
|     `Ctrl+F2`     |    `游戏主画面`     |              纪行奖励              |
|     `Ctrl+F1`     |    `游戏主画面`     |            委托奖励[^1]            |
|        `~`        |    `游戏主画面`     |     执行上述`F1`~`F4`所有操作      |
|     `Ctrl+1`      | `模拟宇宙图鉴-事件` |            事件图鉴奖励            |
|     `Ctrl+2`      |      `无限制`       |          启动第三方小工具          |
|     `Ctrl+3`      |      `无限制`       | 将`StarRail.exe`静音/音量调整到50%[^2] |
| `Ctrl+Alt+LClick` |      `无限制`       |            鼠标快速连点            |

> 使用了`nircmd`工具来进行单应用音量调整，体积很小，功能很足，强烈推荐 [这是链接](http://www.nirsoft.net/utils/nircmd.html)
> 建议使用管理员权限双击打开复制到C盘，这样使用cmd即可全局调用

[^*]: 可用于脚本功能异常时紧急重置
[^1]: 目前只做了获取奖励+重复上一次派遣，没有需求就不做指定派遣了
[^2]: 使用了`nircmd`工具来进行单应用音量调整


## 游戏已经内置的快捷键
> 已经在游戏里内置的快捷键，当然没必要再实现了.jpg
> 
> 放在这里是防止你们没有在游戏里留意到

| 键位  |  使用场景  |     功能     |
| :---: | :--------: | :----------: |
|  `V`  | `战斗场景` | 自动挂机开关 |
|  `B`  | `战斗场景` |  双倍速开关  |


## TODO
- [x] ~~每日实训奖励领取（活跃度奖励）~~
- [x] ~~每日派遣（委托）~~
- [x] ~~完善写法，满足多种分辨率（如`16:9`）的兼容~~
- [x] ~~加入对场景的判断~~
- [x] ~~对`~`键的一键收取做执行优化~~
- [ ] 一键收取提供GUI，优化Tooltips满天飞的情况
- [ ] 对`16:9`做点位适配


## 免责声明
> 1. 脚本为自用，利用空余时间更新，一切以个人习惯优先
> 2. 脚本不盈利，只对软件窗口取色识别+键鼠固定操作复现，未修改游戏数据，无利益相关
> 3. 如有任何传播时添油加醋的行为，与本人无关
> 4. 请遵守`GPLv3`协议，禁止打包出售（或修改后打包出售）
> 5. 参与讨论默认你已理解本脚本的原理，并知晓一定计算机知识
> 6. 未修改游戏数据，不是外挂，理清楚再说话，别当小丑
> 7. 我注意到某些中文表述在翻译后并不准确，我会尽量替换掉这部分内容