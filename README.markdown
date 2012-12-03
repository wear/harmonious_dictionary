# 和谐宝典

和谐宝典用于检查输入是否包含中文或英文敏感词，并可替换为特殊字符。生活在天朝，和谐宝典必须人手必备。

### 特点

* 速度快，比常规的正则匹配要快10倍以上，具体性能可运行benchmark查看
* 可以输出检测到的敏感词，请看初始
* 简单，可根据需要方便的调整敏感词字库

### 使用

<pre>
validate_harmonious_of *attr_names
</pre>

* 检查输入是否包含敏感词 `HarmoniousDictionary.clean?(your_input)`
* 检查包含的敏感词 `HarmoniousDictionary.harmonious_words(your_input)`
* 替换包含的敏感词为* `HarmoniousDictionary.clean(your_input)`

### 安装

准备Gemfile
<pre>
gem harmonious_dictionary
</pre>

创建必要的配置文件
<pre>
rails g harmonious_dictionary:setup
</pre>

然后你需要准备敏感词字库，如果你已经有自己的敏感词库，请把中文和英文词对应复制到项目目录`config/harmonious_dictionary/`下的**chinese_dictionary.txt**和**english_dictionary.txt**。如果还没有自己的词库，就用和谐宝典预备的好了，到 <https://github.com/downloads/wear/harmonious_dictionary/dictionaries.zip> 下载，解压，并替换

最后需要生成序列化的词库，运行
<pre>
rake harmonious_dictionary:generate
</pre>

**ruby 1.8下使用**

对于rails2系列，请使用1.8的branch，以plugin形式使用。敏感词库的配置都在插件harmonious_dictionary里配置

### 原理

不同与常规敏感词检查正则匹配，和谐宝典对输入的中文以给定敏感词字库做为分词词库做分词处理，把里里面的内容找出来。算法采用自yzhang的<https://github.com/yzhang/rseg>，和谐宝典对算法做了简化处理以提高效率。

### License

MIT license

### 联系我
<wear63659220@gmail.com>