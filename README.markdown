# 和谐宝典

和谐宝典用于检查输入是否包含中文或英文敏感词，并可替换为特殊字符。生活在天朝，和谐宝典必须人手必备。

### 特点

* 速度快，比常规的正则匹配要快10倍以上，具体性能可运行benchmark查看
* 可以输出检测到的敏感词，请看初始
* 简单，可根据需要方便的调整敏感词字库

### 使用

首先你需要准备敏感词字库，和谐宝典已经为你准备好了，你可以到 <https://github.com/downloads/wear/harmonious_dictionary/dictionaries.zip> 下载，请解压然后把里面文件放在 *config/harmonious_dictionary*，然后运行 `rake harmonious_dictionary:generate` 生成敏感词库文件。有了敏感词库以后，你可以

* 检查输入是否包含敏感词 `HarmoniousDictionary.clean?(your_input)`
* 检查包含的敏感词 `HarmoniousDictionary.harmonious_words(your_input)`
* 替换包含的敏感词为* `HarmoniousDictionary.clean(your_input)`* 

**ruby 1.9下使用**

**ruby 1.8下使用**

对于rails2系列，请使用1.8的branch，把harmonious_dictionary目录放在 *vendor/plugin* 目录下

### 原理

不同与常规敏感词检查正则匹配，和谐宝典对输入的中文以给定敏感词字库做为分词词库做分词处理，把里里面的内容找出来。算法采用自yzhang的<https://github.com/yzhang/rseg>，和谐宝典对算法做了简化处理以提高效率。

### License

MIT license

### 联系我
<wear63659220@gmail.com>