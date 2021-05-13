# 项目修改记录

`sht-thesis` 项目派生于 `ucasthesis`，一个在 GPLv3 License 下分发的项目。根据该许可证条款，`sht-thesis` 项目列出基于 `ucasthesis` (commit `faad94b` 之后) 的所有修改条目：

## 2021-02-14
> Release: v0.3.2

1. 修复 TexLive 2020 宏包升级后 ulem 的兼容性问题，使用更为鲁棒的 lastpage 实现本科生论文*第X页 共Y页*的排版需求；
2. 更新文档内校徽文件下载链接；
3. 修复 issue [#1](https://github.com/lirundong/shtthesis/issues/1) 关于本科生论文格式的问题；

## 2020-06-30
> Release: v0.3.1

1. 改进 Linux/UNIX 环境下 XeLaTeX 和 LuaLaTeX 引擎的中文字体回退机制；
2. unicode-math 仅对 `\mathbf` 强制使用 `\symbf` 覆盖，其他命令保持原有语义；
3. 确保 hyperref 宏包在导言区最后被导入；
4. 从该版本开始，所有 release 同步发布至 Overleaf （真香）。

## 2020-06-23
> Release: v0.3.0

1. （试验性地）支持本科论文排版；
2. 将参考文献后端改为 biblatex；
3. 添加编号定理、证明等常用数学环境；
4. 将学位指定从 `\shtsetup` 移至类选项；

## 2020-06-05

项目名称改为 shtthesis，并完全重构项目结构。

> Release: v0.2.0

1. 重构项目结构，只需指定 `\documentclass{shtthesis}` 即可满足基本排版格式要求；
2. 提供 `\shtsetup` 命令统一设定论文信息：
   ```latex
   \shtsetup{
     title = {论文标题},
     title* = {Title~of~Thesis},
     author = {作者姓名},
     author* = {Name~of~Author},
     % ...
   }
   ```
3. 根据重构后的模板类重新编写了使用说明文档；
4. 正文章节不再仅开始于奇数页。

## 2020-02-26

> Release: v0.1.1

1. 将 ctex-fontset-noto.def 中楷书和仿宋字体修改为 Fandol 系列，以避免可能的侵权问题；
2. 将封面标题 `\bfesries` 修改为 `\heiti`，以确保英文以衬线字体排版；

## 2020-02-14

1. 在 Style/ucasthesis.cls 中设置 `\paragraph{}` 行首缩进 2 中文字符；

## 2020-02-13

> Release: v0.1.0

1. 修改 Style/artratex.sty 和 Style/ucasthesis.cls，配置 `unicode-math` 中 `\math***` 宏的排版方式为 `sym`，以解决附录 A.2 中 `\mathbf` 无效，以及各 `\math***` 宏无法正确设定希腊字母及符号的问题；
2. 移除 pdfTeX 支持（使用 pdfTeX 编译将直接报错），将针对 `unicode-math` 定义的数学宏移至 Style/artracom.sty 中；
3. 修改 Style/ucasthesis.cfg 和 Style/ucasthesis.cls，使封面符合上科大规范需求；

## 2020-02-12

1. 支持将字体文件放置在在 `Fonts` 文件夹中，修改字体配置文件名为 `ctex-fontset-source.def`；
2. 将 `ctex-fontset-source.def` 中楷体替换为华文楷体，以确保楷体正确加粗；
3. 修改 `Style/artratex.sty`，将西文字体修改为：
   - Serif: XITS
   - Sans Serif: TeX Gyre Hero
   - Monospace: TeX Gyre Cursor

   同时，去除对 `\mathsf` 和 `\mathtt` 的不正确字形覆盖； 
4. 修改 `Style/ucasthesis.cls` 中目录及章节标题的 `format`，将 `\sffamily` 替换为 `\heiti`，以确保在西文非衬线字体被设为 TeX Gyre Hero 后，各级标题仍以西文衬线+中文黑体排版；

## 2020-02-10

1. 在 Style/artratex.sty 中取消等宽字体设置，默认不开启 `font=noto`；

## 2020-02-07

1. 修改 Style/ucasthesis.cfg 以符合上科大学位论文封面、声明页要求；
2. 在 Style/artratex.sty 中设置 Courier 为默认等宽字体；

## 2020-02-06

1. 显式地在项目根目录添加包含 GPLv3 完整内容的 License 文件；
2. 添加 .gitignore 文件；
3. 修改 README.md 以包含新的项目名称及相关说明；
4. 将两个项目的改动统一放置在 CHANGELOG.md 文件中；
5. 将 `Img/ucas_logo.pdf` 替换为 `Img/shanghaitech_logo.pdf`
6. 增加字体设置 ctex-fontset-noto.def，将主要字体替换为：
   - 思源宋体
   - 思源黑体
   - 方正楷体_GBK（中文斜体）
   - 方正新楷体（中文粗斜体）
   - 方正仿宋_GBK（中文等宽体）
   - 方正刻本仿宋简体（中文粗等宽体）

   其中，思源系列字体（Google 发行版为 Noto 系列）开源免费，所用方正字体对个人非商用免费，可前往[方正字库官网](https://www.foundertype.com/)申请下载使用。

## 以下修改来自 `ucasthesis` (commit `faad94b` 及之前) 

* `2020-01-09` **重要通知**：模板样式进行了修改，请查看下面的修改描述，以决定是否需要更新。

* `2020-01-09` 根据 [NineSH, issue #223](https://github.com/mohuangrui/ucasthesis/issues/223) 修复`bicaption`错误。

* `2019-12-06` 移除 commit 中的二进制文件，以极大减少 Fork 后的文件大小。

* `2019-10-12` 根据 [huiwenzhang, issue #198](https://github.com/mohuangrui/ucasthesis/issues/198) 修复`mainmatter`下`\chapter*`的页眉错误。

* `2019-10-12` 根据 [Fancy0609, muzimuzhi, issue #195](https://github.com/mohuangrui/ucasthesis/issues/195) 调整由`AutoFakeBold`控制的伪粗体加粗程度。

* `2019-10-11` 根据 [Pantrick, issue #190](https://github.com/mohuangrui/ucasthesis/issues/190) 采用 [muzimuzhi](https://github.com/muzimuzhi) 提供的方法实现`\advisor{}`和`\institute{}`的自动换行功能。

* `2019-08-01` 根据 [vectorliu, issue #183](https://github.com/mohuangrui/ucasthesis/issues/183) 修改英文模式下的`plain`选项为`scheme=plain`以消除对`Algorithm`样式的修改。

* `2019-06-15` 根据 [HaorenWang, issue #177](https://github.com/mohuangrui/ucasthesis/issues/177) 调整矢量、矩阵、张量字体样式。

* `2019-06-09` 根据 [DRjy, issue #170](https://github.com/mohuangrui/ucasthesis/issues/170) 轻微缩减目录中编号与标题的间距；根据 [e71828, issue #174](https://github.com/mohuangrui/ucasthesis/issues/174) 轻微增加页眉中编号与标题的间距。

* `2019-05-25` 根据 [CDMA2019, issue #169](https://github.com/mohuangrui/ucasthesis/issues/169) 提供横排图表环境下页眉页脚的横排，具体使用见 [横排图表](https://github.com/mohuangrui/ucasthesis/wiki/横排图表)。

* `2019-04-24` 拓展模版兼容 [博后报告](https://github.com/mohuangrui/ucasthesis/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98#%E5%A6%82%E4%BD%95%E5%A1%AB%E5%86%99%E5%8D%9A%E5%A3%AB%E5%90%8E%E7%9A%84-frontinfotex-)。修复 [gsp2014, issue #156](https://github.com/mohuangrui/ucasthesis/issues/156) 文献引用中的连字符的间断显示和上标引用中逗号下沉。

* `2019-04-19` 修复 [nihaomiao, issue #117](https://github.com/mohuangrui/ucasthesis/issues/117)`\mathbf`失效问题。

* `2019-04-16` 修复国际生需要的`plain`模式下无法改变英文章标题字体大小的问题。

* `2019-04-09` 对部分宏命令进行调整，无功能及样式上的修改。若需更新，建议参考 [更新指南](https://github.com/mohuangrui/ucasthesis/wiki/更新指南)。

* `2019-04-04` 根据 [liuy334, songchunlin, issue #134](https://github.com/mohuangrui/ucasthesis/issues/134) ，调整行距使`LaTeX`版与`Word`版的行数和每行字数相一致。

* `2019-03-28` 根据 [zssasa, allenwoods, issue #49](https://github.com/mohuangrui/ucasthesis/issues/49) ，修复`bicaption`对`longtable`的兼容性。根据 [BowenHou, issue #133](https://github.com/mohuangrui/ucasthesis/issues/133) ，使下划线能对长标题自动换行。

* `2019-03-25` 根据 [DRjy, muzimuzhi, issue #127](https://github.com/mohuangrui/ucasthesis/issues/127) ，为`摘要`等无需在目录中显示的结构元素建立书签。根据 [muzimuzhi, issue #130](https://github.com/mohuangrui/ucasthesis/issues/130) ，修正对`\voffset`的使用。

* `2019-03-14` 根据 [opt-gaobin, issue #121](https://github.com/mohuangrui/ucasthesis/issues/121) ，修正中文标点使下划线断掉的问题。根据 [Guoqiang Zhang, email; weili-ict, issue #120](https://github.com/mohuangrui/ucasthesis/issues/120) ，修复`\proofname`命令对2015年及更早`LaTeX`编译器的兼容性问题。

* `2019-02-20` 根据 [opt-gaobin, issue #100](https://github.com/mohuangrui/ucasthesis/issues/100) ，增加定理、定义、证明等数学环境。根据 [DRjy, issue #102](https://github.com/mohuangrui/ucasthesis/issues/102) ，调整`\mathcal`字体样式。根据 [zike Liu, email] ，适当缩减目录列表的缩进。根据 [xiaoyaoE, issue #105](https://github.com/mohuangrui/ucasthesis/issues/105) ，使数字字体和英文字体一致。完善中文版和国际版之间的中英格式切换。

* `2019-01-10` 根据 [mnpengjk, issue #57](https://github.com/mohuangrui/ucasthesis/issues/57) ， 将公式编号前加点纳入模版默认，更多讨论可见：[琐屑细节](https://github.com/mohuangrui/ucasthesis/wiki/琐屑细节) 。根据 [yunyun2019, issue #95](https://github.com/mohuangrui/ucasthesis/issues/95) ，采用 [zepinglee](https://github.com/zepinglee) 基于国标样式为`ucas`所定制文献样式：[ucas 样式分支](https://github.com/CTeX-org/gbt7714-bibtex-style/tree/ucas) ，文献样式更多讨论可见：[文献样式](https://github.com/mohuangrui/ucasthesis/wiki/%E6%96%87%E7%8C%AE%E6%A0%B7%E5%BC%8F)。根据 [邵岳林, email] ，将附录复原为常规的排版设置，若需将附录置于参考文献后，请见：[琐屑细节](https://github.com/mohuangrui/ucasthesis/wiki/琐屑细节)。

* `2018-04-03` 根据国科大本科部陆晴老师和本科部学位办丁云云老师的复审审核建议再次修复一些样式细节问题。

* `2018-04-02` 模板进行了重大更新，修复了样式、字体、格式等许多问题。

    * 根据国科大本科部陆晴老师的建议对模版样式进行了诸多拓展和修正，并完善对本科生论文元素的兼容性。
    * 在 [ctex](https://github.com/CTeX-org/ctex-kit) 开发者的帮助下解决了如何多次调用`Times New Roman`而不导致黑体调用错误的问题。根据 [twn1993, email]，修复默认黑体为微软雅黑而不是`SimHei`的问题。
    * 繁复折腾测试后终于找出一个在`ctex`默认黑体替换粗宋体设定环境内全局`AutoFakeBold`失效状态下折衷特定字体库不全条件下生僻字显示和系统默认字重不全条件下粗宋体显示以及不同操作系统下如何平衡上述字库自重矛盾还有根据操作系统自动调用所带有的`Times`字体的方案。
    * 设定论文封面据英文学位名如自动切换。密级据是否填写自动显示。

* `2018-03-22` 演示表标题居表上，加粗图表标注，设置长图表标题悬挂缩进（由于`bicaption`宏包无法正确接受`caption`宏包的`margin`选项，图表中英标题第一行无法正确同步缩进，从而放弃第一行的缩进），强调多图中子图标题的规范使用，通过摘要和符号列表演示标题不在目录中显示却仍在页眉中显示。根据 [赵永明, email]，设置双语图表标题和`bicaption`不在图形列表和表格列表中显示英文标题。

* `2018-03-21` 根据 [zhanglinbo, issue #42](https://github.com/mohuangrui/ucasthesis/issues/42) ，使用 [xiaoyao9933](https://github.com/xiaoyao9933/UCASthesis) 制作的`ucas_logo.pdf`使学校`logo`放大不失真。根据 [Starsky Wong, issue #41](https://github.com/mohuangrui/ucasthesis/issues/41) ，设置标题英文设为`Times New Roman`。根据 [will0n, issue #29](https://github.com/mohuangrui/ucasthesis/issues/29) ，[Man-Ting-Fang, issue #26](https://github.com/mohuangrui/ucasthesis/issues/26) ，[diyiliaoya, issue #12](https://github.com/mohuangrui/ucasthesis/issues/12) ，和 [赵永明, email] ，矫正一些格式细节问题。根据 [tangjie1992, issue #30](https://github.com/mohuangrui/ucasthesis/issues/30) ，配置算法环境。

* `2018-02-04` 在 [ctex](https://github.com/CTeX-org/ctex-kit) 开发者的帮助下修复误用字体命令导致的粗宋体异常。然后，将模板兼容性进一步扩展为兼容操作系统`Windows`，`Linux`，`MacOS`和`LaTeX `编译引擎`pdflatex`，`xelatex`，`lualatex`。移除`microtype`宏包以提高编译效率。

* `2018-01-28` 基于国科大`2018`新版论文规范进行了重大修改，采用新的封面、声明、页眉页脚样式。展示标题中使用数学公式。

* `2017-05-14` 根据 [赵永明, email] ，增加`\citepns{}`和`\citetns{}`命令提供上标引用下混合非上标引用的需求。根据 [臧光明, email] ，添加设定论文为`thesis`或`dissertation`的命令。