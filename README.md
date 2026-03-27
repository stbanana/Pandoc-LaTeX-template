# 产品说明书（Pandoc + LaTeX）

## 环境需求

windows 环境下，需要手动下载 `Pandoc` 和 `LaTeX`，并添加进环境变量。

确认使用 `Pandoc -v` `LaTeX -v` 终端指令可以正确获得软件版本号。

## 快速开始

1. 编辑内容：
   - 版本记录：`manuscript/01-version.md`
   - 正文：`manuscript/10-body.md` 及后续连续编码附加页
   - 附表：`manuscript/90-appendix.md`
2. 生成 PDF：运行 `build.ps1`，使用如下指令
```powershell
chcp 65001
$OutputEncoding = [System.Text.UTF8Encoding]::new()
& ".\build.ps1"
```
3. 生成 html：使用完整指令链。不推荐，pandoc 产物 html 不便于美化。
```powershell
chcp 65001
$OutputEncoding = [System.Text.UTF8Encoding]::new()
$OutputDir = ".\output"
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
Copy-Item -Path ".\assets" -Destination $OutputDir -Recurse -Force
pandoc --from markdown+raw_tex --to html --standalone --toc --toc-depth=3 --quiet --metadata-file ".\metadata-html.yaml" --css "assets/css/document.css" ".\manuscript\00-frontmatter.md" ".\manuscript\01-version.md" ".\manuscript\02-toc.md" ".\manuscript\09-mainmatter.md" ".\manuscript\10-body.md" ".\manuscript\11-body1.md" ".\manuscript\80-appendix-marker.md" ".\manuscript\90-appendix.md" ".\manuscript\99-backmatter.md" -o "$OutputDir\product.html"
```

## 一个结果 pdf 的展示

![产物](https://cloudflare-imgbed-6qt.pages.dev/file/1773116302718_image.png)

## 实际编写

> [!NOTE]
>
> 内容产出仅需要按序编写 manuscript 文件夹中的所有 .md 文件。

## 目录与页码规则

- 前置部分（封面、附加头页、目录）：罗马数字页码（Ⅰ、Ⅱ…），无页眉
- 正文：页码按“章-页”编号，如 `1-1`、`1-2`；页眉为对应章标题
- 附表：页码按“附录字母-页”编号，如 `A-1`、`B-1`；页眉为对应附表标题
- 目录仅包含 1~3 级标题，4 级及之后不显示

## 自定义与扩展

- 封面：`tex/cover.tex`
- 封底：`tex/backcover.tex`
- 页眉页脚与书签设置：`tex/header.tex`
- 文档元数据：`metadata.yaml`

## 当前已验证样式

- 字体：中英文均使用 IBM Plex Sans 系列（由 `tex/header.tex` 中 `\setmainfont` 与 `\setCJKmainfont` 控制）,斜体为了支持中英文，使用 MapleMono 系列。
- 一级标题颜色：`#0f62fe`
- 一级标题编号样式：`1. 标题`（同一行显示）
- 已验证命令：
```powershell
chcp 65001
$OutputEncoding = [System.Text.UTF8Encoding]::new()
& ".\build.ps1"
```

## 输出文件

- `output/product.pdf`
