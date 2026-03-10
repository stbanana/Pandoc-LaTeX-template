# 总览

## 产品定位

ABCDEFG

abcdefg

### 目标用户

舞低杨柳楼心月，歌尽桃花扇底风。

#### 细分说明（不进目录）

这段正文展示了在正文中的标记，一个**加粗**，一个*斜体*，一个\underline{下划线}，一个^上标^，一个~下标~，一个[超链接](https://www.yono233.cn)。

## 价值主张

# 功能说明

## 核心功能


这是一个横向排版的图片示例（示例1、示例2）。这里横向排版用作显示，没有自动编号。
写法相对简单。pdf产物可以正确显示，html产物则不可以。

![图片描述1](assets/images/示例1.png){width=48%}
![图片描述2](assets/images/示例2.jpg){width=48%}

这是一个单独排版的图片示例（示例3）。单独排版会有自动编号。

![图片描述3](assets/images/示例3.jpg){width=50%}

### 功能边界

这里填写功能边界的内容。

# 运维与支持

## 部署与环境

这是一个横向排版的图片示例（示例1、示例2）。

这里使用的 latex 或 html 原版写法，排版自由，产生编号。

```{=latex}
\begin{center}
\begin{minipage}[t]{0.48\textwidth}
\centering
\includegraphics[width=\linewidth]{assets/images/示例1.png}
\captionof{figure}{图片描述1}
\label{fig:sample1}
\end{minipage}\hfill
\begin{minipage}[t]{0.48\textwidth}
\centering
\includegraphics[width=\linewidth]{assets/images/示例2.jpg}
\captionof{figure}{图片描述2}
\label{fig:sample2}
\end{minipage}
\end{center}
```

```{=html}
<div class="columns">
  <div class="column" style="width: 48%;">
    <img src="assets/images/示例1.png" alt="图片描述1" />
    <p>图片描述1</p>
  </div>
  <div class="column" style="width: 48%;">
    <img src="assets/images/示例2.jpg" alt="图片描述2" />
    <p>图片描述2</p>
  </div>
</div>
```

这是一个单独排版的图片示例（示例3）。

![图片描述3](assets/images/示例3.jpg){#fig:sample3 width=50%}

填充到下一页

填充到下一页

填充到下一页

填充到下一页

填充到下一页

填充到下一页

填充到下一页

填充到下一页

填充到下一页

填充到下一页

填充到下一页
