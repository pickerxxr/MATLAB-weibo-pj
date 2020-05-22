# MATLAB 微博数据分析论文

## 摘要





## 读取数据文件

> 以导入广州的数据文件为例

```matlab
%% Guangzhou
filename = '.\Guangzhou.csv';
delimiter = ',';
startRow = 2;
formatSpec = '%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
Guangzhou = table(dataArray{1:end-1}, 'VariableNames', {'author','source','forward_num','comment_num','likes_num','month','day','hour','is_original','forward_link_length','original_word_num','content_word_num','forward_word_num','sentiment','emoji_num','tag_num','mention_num','is_located','link_num','topic_num'});
clearvars filename delimiter startRow formatSpec fileID dataArray ans;
```

> 运行结果如下

```matlab
%%
>> who

您的变量为:

Guangzhou  Hangzhou   Kunming  

%%
>> class(Guangzhou)

ans =

    'table'
```

- 这里一个实现过程中发现的问题是用户的id是一个六位的序列号，而不是数值型的元素，所以不能直接用`csvread(filename);`命令（只能读入数据类型一致的csv文件），如果序列号出现开头为0的项，会出现格式改变的问题，所以尝试了采用`textscan(fileID);`的命令，而把第一项当成`%s`来看。



## 一些基本统计量的分析

### 用户发送微博条数

1、首先是对于第一个用户名ID`author`变量的统计，通过对于三个城市发送微博数量的统计，找出post的数目分布情况。其中以30条微博为分界线，通过简单的`histogram()`命令画出两个统计量的分布。这里取到30为分解的首要原因是，数据采样采取的是一个月($\approx30$)内的用户数据，而可以依据经验认为30以上的可以看作非常活跃的用户(平均每天发一条以上)，而30以下的相对没那么活跃；另外，通过所有数据的分布图可以看出，数据太过于集中于0~2附近，使得在高数量区域的分布无法显示，所以对于30以上的数据另作处理。

|           | Distribution of all post data ($\times10^3$)                 | Distribution of more than 30                                 | Distribution of less than 30                                 |
| --------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Guangzhou | ![all_distribution_gz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\all_distribution_gz.jpg) | ![distribution_gz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_gz.jpg) | ![distribution_gz_2](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_gz_2.jpg) |
| Hangzhou  | ![all_distribution_hz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\all_distribution_hz.jpg) | ![distribution_hz](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_hz.jpg) | ![distribution_hz2](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_hz2.jpg) |
| Kunming   | ![all_distribution_km](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\all_distribution_km.jpg) | ![distribution_km](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_km.jpg) | ![distribution_km_2](C:\Users\seven\Desktop\MATLAB大作业\MATLAB-weibo-pj\graphs\distribution_km_2.jpg) |

- 从图表中可以很明显看到大多数用户这一个月内大多数集中在1, 2条微博的区间，而在200条以上的就接近于0了。



2. 另外，对每个城市发表次数最多的用户ID挑出，因为观察到发表最大的次数高达四位数，平均一天甚至上百，让我对这种用户的行为产生了好奇，初步**猜测可能是新闻的官方号或者是僵尸流量粉**，所以将其用户ID挑出，在后续进行进一步账号分析，如果必要可能再尝试挑选发表的前几位进行分析。

   ```matlab
   %% Guangzhou
   >> {gz_post_max_id; gz_post_max}
   
   ans =
   
     2×1 cell 数组
   
       {'523187'}
       {[  4423]}
       
   %% Hangzhou
   >> {hz_post_max_id; hz_post_max}
   
   ans =
   
     2×1 cell 数组
   
       {'428875'}
       {[  9685]}
   %% Kunming
   >> {km_post_max_id; km_post_max}
   
   ans =
   
     2×1 cell 数组
   
       {'024326'}
       {[  1904]}
   ```

   

