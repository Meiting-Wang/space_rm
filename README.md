# Stata 小程序：space_rm——去除字符串括号里的空格

> 作者：王美庭  
> Email: wangmeiting92@gmail.com

## 目录

- **一、引言**
- **二、命令的安装**
- **三、语法与选项**
- **四、实例**
- **五、输出效果展示**

## 一、引言

在编写程序时，因为时常要去除字符串括号里的空格，所以自己写了个小程序。该命令有相应的适用范围，就是只允许括号内有且仅有一个“单词”，如`mean(price )`、`sd(  mpg )`、`min(trunk  )  max(  mpg  )`等。

除了去除括号内的空格，该命令还会将括号外的长空格（连续的多个空格）压缩为单个空格。同时输出结果也会被储存在`r()`中。

## 二、命令的安装

`space_rm`命令以及本人其他命令的代码都托管于 GitHub 上，读者可随时下载安装这些命令。

你可以通过系统自带的`net`命令进行安装：

```stata
net install space_rm, from("https://raw.githubusercontent.com/Meiting-Wang/space_rm/master")
```

也可以通过`github`外部命令进行安装（`github`命令本身可以通过`net install github, from("https://haghish.github.io/github/")`进行安装）：

```stata
github install Meiting-Wang/space_rm
```

## 三、语法与选项

**命令语法**：

```stata
space_rm strings
```

## 四、实例

```stata
space_rm n mean(   price   ) sd(   mpg   ) min(price  ) max(  trunk)
space_rm (   price   ) sd(   mpg   ) min(price  ) max(  trunk)
space_rm (   price   )(   mpg   ) min(price  ) max(  trunk)
space_rm sd(   mpg   ) min(price  ) max(  trunk)
return list
```

> 以上所有实例都可以在`help space_rm`中直接运行。  
> ![image](https://user-images.githubusercontent.com/42256486/90331475-3ce06600-dfe7-11ea-8add-931f15ddb7af.png)

## 五、输出效果展示

```stata
. space_rm n mean(   price   ) sd(   mpg   ) min(price  ) max(  trunk)
n mean(price) sd(mpg) min(price) max(trunk)

. space_rm (   price   ) sd(   mpg   ) min(price  ) max(  trunk)
(price) sd(mpg) min(price) max(trunk)

. space_rm (   price   )(   mpg   ) min(price  ) max(  trunk)
(price)(mpg) min(price) max(trunk)

. space_rm sd(   mpg   ) min(price  ) max(  trunk)
sd(mpg) min(price) max(trunk)

. return list

macros:
            r(out_str) : "sd(mpg) min(price) max(trunk)"
```
